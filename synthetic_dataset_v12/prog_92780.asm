; DESCRIPTION: Composite: Draws a yellow rectangle at (358, 33) with width 52 and height 106 then Places a blue dot at position (444, 100) then Places a yellow line segment connecting (368, 130) to (36, 176).
; PLAN: r0=358(x), r1=33(y), r2=52(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=444(x), r6=100(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=368(x1), r11=130(y1), r12=36(x2), r13=176(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 358
LDI r1, 33
LDI r2, 52
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 100
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 368
LDI r11, 130
LDI r12, 36
LDI r13, 176
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
