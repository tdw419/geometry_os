; DESCRIPTION: Places a blue line segment connecting (100, 184) to (346, 77).
; PLAN: r0=100(x1), r1=184(y1), r2=346(x2), r3=77(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 184
LDI r2, 346
LDI r3, 77
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
