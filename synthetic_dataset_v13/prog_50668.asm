; DESCRIPTION: Composite: Draws a orange line from (14, 165) to (322, 102) then Places a magenta circle of radius 44 at center (45, 126).
; PLAN: r0=14(x1), r1=165(y1), r2=322(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=45(x), r6=126(y), r7=44(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 14
LDI r1, 165
LDI r2, 322
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 126
LDI r7, 44
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
