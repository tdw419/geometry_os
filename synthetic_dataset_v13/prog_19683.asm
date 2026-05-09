; DESCRIPTION: Places a white line segment connecting (292, 120) to (317, 216).
; PLAN: r0=292(x1), r1=120(y1), r2=317(x2), r3=216(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 120
LDI r2, 317
LDI r3, 216
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
