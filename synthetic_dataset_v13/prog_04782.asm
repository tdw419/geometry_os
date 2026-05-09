; DESCRIPTION: Places a magenta line segment connecting (292, 164) to (348, 84).
; PLAN: r0=292(x1), r1=164(y1), r2=348(x2), r3=84(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 164
LDI r2, 348
LDI r3, 84
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
