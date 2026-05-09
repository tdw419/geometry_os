; DESCRIPTION: Draws a green line from (311, 180) to (161, 81).
; PLAN: r0=311(x1), r1=180(y1), r2=161(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 180
LDI r2, 161
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
