; DESCRIPTION: Draws a green line from (461, 245) to (118, 78).
; PLAN: r0=461(x1), r1=245(y1), r2=118(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 245
LDI r2, 118
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
