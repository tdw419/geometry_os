; DESCRIPTION: Places a red line segment connecting (10, 164) to (317, 88).
; PLAN: r0=10(x1), r1=164(y1), r2=317(x2), r3=88(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 164
LDI r2, 317
LDI r3, 88
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
