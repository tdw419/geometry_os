; DESCRIPTION: Draws a green line from (311, 134) to (503, 226).
; PLAN: r0=311(x1), r1=134(y1), r2=503(x2), r3=226(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 134
LDI r2, 503
LDI r3, 226
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
