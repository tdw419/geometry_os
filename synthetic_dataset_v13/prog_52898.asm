; DESCRIPTION: Places a black line segment connecting (446, 216) to (292, 80).
; PLAN: r0=446(x1), r1=216(y1), r2=292(x2), r3=80(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 216
LDI r2, 292
LDI r3, 80
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
