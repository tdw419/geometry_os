; DESCRIPTION: Places a magenta line segment connecting (292, 43) to (419, 95).
; PLAN: r0=292(x1), r1=43(y1), r2=419(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 43
LDI r2, 419
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
