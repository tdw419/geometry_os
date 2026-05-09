; DESCRIPTION: Composite: Draws a orange line from (262, 185) to (505, 162) then Draws a magenta circle centered at (418, 74) with radius 64.
; PLAN: r0=262(x1), r1=185(y1), r2=505(x2), r3=162(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=418(x), r6=74(y), r7=64(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 262
LDI r1, 185
LDI r2, 505
LDI r3, 162
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 74
LDI r7, 64
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
