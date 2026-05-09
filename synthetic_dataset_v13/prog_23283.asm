; DESCRIPTION: Places a red line segment connecting (377, 72) to (120, 244).
; PLAN: r0=377(x1), r1=72(y1), r2=120(x2), r3=244(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 72
LDI r2, 120
LDI r3, 244
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
