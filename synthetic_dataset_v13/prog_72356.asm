; DESCRIPTION: Composite: Draws a black circle centered at (272, 211) with radius 14 then Renders a blue line between points (87, 112) and (96, 130) then Renders a red box of size 94x28 starting at (362, 107).
; PLAN: r0=272(x), r1=211(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=87(x1), r6=112(y1), r7=96(x2), r8=130(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=362(x), r11=107(y), r12=94(width), r13=28(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 272
LDI r1, 211
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 87
LDI r6, 112
LDI r7, 96
LDI r8, 130
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 362
LDI r11, 107
LDI r12, 94
LDI r13, 28
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
