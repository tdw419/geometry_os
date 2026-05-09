; DESCRIPTION: Places a green line segment connecting (180, 252) to (292, 105).
; PLAN: r0=180(x1), r1=252(y1), r2=292(x2), r3=105(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 252
LDI r2, 292
LDI r3, 105
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
