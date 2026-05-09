; DESCRIPTION: Draws a orange line from (257, 190) to (213, 216).
; PLAN: r0=257(x1), r1=190(y1), r2=213(x2), r3=216(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 190
LDI r2, 213
LDI r3, 216
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
