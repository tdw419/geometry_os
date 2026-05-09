; DESCRIPTION: Places a red line segment connecting (435, 121) to (317, 34).
; PLAN: r0=435(x1), r1=121(y1), r2=317(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 121
LDI r2, 317
LDI r3, 34
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
