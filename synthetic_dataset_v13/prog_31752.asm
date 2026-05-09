; DESCRIPTION: Places a black line segment connecting (317, 158) to (475, 212).
; PLAN: r0=317(x1), r1=158(y1), r2=475(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 158
LDI r2, 475
LDI r3, 212
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
