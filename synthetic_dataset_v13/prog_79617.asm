; DESCRIPTION: Composite: Draws a red line from (452, 37) to (377, 105) then Creates a magenta circular shape at (105, 111) with radius 43.
; PLAN: r0=452(x1), r1=37(y1), r2=377(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=105(x), r6=111(y), r7=43(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 452
LDI r1, 37
LDI r2, 377
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 111
LDI r7, 43
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
