; DESCRIPTION: Composite: Draws a magenta circle centered at (345, 98) with radius 49 then Renders a orange line between points (209, 241) and (105, 162).
; PLAN: r0=345(x), r1=98(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=209(x1), r6=241(y1), r7=105(x2), r8=162(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 345
LDI r1, 98
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 209
LDI r6, 241
LDI r7, 105
LDI r8, 162
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
