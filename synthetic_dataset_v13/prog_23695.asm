; DESCRIPTION: Places a green line segment connecting (308, 95) to (377, 20).
; PLAN: r0=308(x1), r1=95(y1), r2=377(x2), r3=20(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 95
LDI r2, 377
LDI r3, 20
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
