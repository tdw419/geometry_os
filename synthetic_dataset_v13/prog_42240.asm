; DESCRIPTION: Draws a white line from (292, 94) to (311, 214).
; PLAN: r0=292(x1), r1=94(y1), r2=311(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 94
LDI r2, 311
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
