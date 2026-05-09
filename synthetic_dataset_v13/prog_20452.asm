; DESCRIPTION: Composite: Renders a blue line between points (493, 141) and (5, 112) then Creates a orange circular shape at (39, 201) with radius 25 then Draws a black rectangle at (425, 86) with width 66 and height 32.
; PLAN: r0=493(x1), r1=141(y1), r2=5(x2), r3=112(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=39(x), r6=201(y), r7=25(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=425(x), r11=86(y), r12=66(width), r13=32(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 493
LDI r1, 141
LDI r2, 5
LDI r3, 112
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 39
LDI r6, 201
LDI r7, 25
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 425
LDI r11, 86
LDI r12, 66
LDI r13, 32
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
