; DESCRIPTION: Places a blue line segment connecting (246, 54) to (419, 95).
; PLAN: r0=246(x1), r1=54(y1), r2=419(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 54
LDI r2, 419
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
