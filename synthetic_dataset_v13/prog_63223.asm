; DESCRIPTION: Renders a green line between points (292, 79) and (94, 216).
; PLAN: r0=292(x1), r1=79(y1), r2=94(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 79
LDI r2, 94
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
