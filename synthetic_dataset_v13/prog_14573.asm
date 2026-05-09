; DESCRIPTION: Draws a orange line from (417, 207) to (245, 37).
; PLAN: r0=417(x1), r1=207(y1), r2=245(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 207
LDI r2, 245
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
