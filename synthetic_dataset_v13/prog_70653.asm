; DESCRIPTION: Composite: Draws a orange line from (307, 80) to (291, 200) then Sets a single blue pixel at (190, 135).
; PLAN: r0=307(x1), r1=80(y1), r2=291(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=190(x), r6=135(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 307
LDI r1, 80
LDI r2, 291
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 135
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
