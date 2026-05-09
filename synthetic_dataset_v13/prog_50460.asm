; DESCRIPTION: Composite: Renders a black box of size 81x120 starting at (280, 132) then Draws a white line from (373, 49) to (354, 235) then Renders a black disk with center (295, 115) and radius 54.
; PLAN: r0=280(x), r1=132(y), r2=81(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=373(x1), r6=49(y1), r7=354(x2), r8=235(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=295(x), r11=115(y), r12=54(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 280
LDI r1, 132
LDI r2, 81
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 49
LDI r7, 354
LDI r8, 235
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 295
LDI r11, 115
LDI r12, 54
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
