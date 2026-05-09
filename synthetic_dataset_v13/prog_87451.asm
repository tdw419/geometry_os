; DESCRIPTION: Places a blue line segment connecting (434, 26) to (303, 238).
; PLAN: r0=434(x1), r1=26(y1), r2=303(x2), r3=238(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 26
LDI r2, 303
LDI r3, 238
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
