; DESCRIPTION: Places a green line segment connecting (96, 55) to (419, 50).
; PLAN: r0=96(x1), r1=55(y1), r2=419(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 55
LDI r2, 419
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
