; DESCRIPTION: Composite: Renders a white line between points (42, 235) and (422, 122) then Places a blue circle of radius 51 at center (263, 96) then Renders a green box of size 24x54 starting at (203, 128).
; PLAN: r0=42(x1), r1=235(y1), r2=422(x2), r3=122(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=263(x), r6=96(y), r7=51(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=203(x), r11=128(y), r12=24(width), r13=54(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 42
LDI r1, 235
LDI r2, 422
LDI r3, 122
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 96
LDI r7, 51
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 203
LDI r11, 128
LDI r12, 24
LDI r13, 54
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
