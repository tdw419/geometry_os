; DESCRIPTION: Composite: Draws a orange line from (330, 231) to (190, 94) then Sets a single blue pixel at (34, 67).
; PLAN: r0=330(x1), r1=231(y1), r2=190(x2), r3=94(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=34(x), r6=67(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 330
LDI r1, 231
LDI r2, 190
LDI r3, 94
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 34
LDI r6, 67
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
