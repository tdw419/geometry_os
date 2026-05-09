; DESCRIPTION: Places a red line segment connecting (220, 238) to (317, 62).
; PLAN: r0=220(x1), r1=238(y1), r2=317(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 238
LDI r2, 317
LDI r3, 62
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
