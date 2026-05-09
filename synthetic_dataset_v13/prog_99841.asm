; DESCRIPTION: Draws a orange line from (117, 190) to (111, 86).
; PLAN: r0=117(x1), r1=190(y1), r2=111(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 190
LDI r2, 111
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
