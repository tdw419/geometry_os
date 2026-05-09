; DESCRIPTION: Composite: Draws a orange line from (194, 7) to (137, 166) then Renders a blue disk with center (112, 81) and radius 51.
; PLAN: r0=194(x1), r1=7(y1), r2=137(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=112(x), r6=81(y), r7=51(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 194
LDI r1, 7
LDI r2, 137
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 81
LDI r7, 51
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
