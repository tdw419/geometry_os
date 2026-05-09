; DESCRIPTION: Draws a orange line from (225, 98) to (417, 61).
; PLAN: r0=225(x1), r1=98(y1), r2=417(x2), r3=61(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 98
LDI r2, 417
LDI r3, 61
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
