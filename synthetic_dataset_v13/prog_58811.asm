; DESCRIPTION: Composite: Renders a orange line between points (124, 180) and (449, 181) then Draws a magenta circle centered at (173, 187) with radius 53.
; PLAN: r0=124(x1), r1=180(y1), r2=449(x2), r3=181(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=173(x), r6=187(y), r7=53(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 124
LDI r1, 180
LDI r2, 449
LDI r3, 181
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 187
LDI r7, 53
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
