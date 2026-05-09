; DESCRIPTION: Draws a orange line from (467, 226) to (458, 186).
; PLAN: r0=467(x1), r1=226(y1), r2=458(x2), r3=186(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 226
LDI r2, 458
LDI r3, 186
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
