; DESCRIPTION: Places a red line segment connecting (478, 250) to (271, 238).
; PLAN: r0=478(x1), r1=250(y1), r2=271(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 250
LDI r2, 271
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
