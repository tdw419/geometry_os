; DESCRIPTION: Composite: Draws a magenta rectangle at (80, 88) with width 105 and height 91 then Sets a single white pixel at (19, 15) then Renders a orange line between points (300, 51) and (247, 83).
; PLAN: r0=80(x), r1=88(y), r2=105(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=19(x), r6=15(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=300(x1), r11=51(y1), r12=247(x2), r13=83(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 80
LDI r1, 88
LDI r2, 105
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 15
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 300
LDI r11, 51
LDI r12, 247
LDI r13, 83
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
