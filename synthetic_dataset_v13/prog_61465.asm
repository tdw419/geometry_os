; DESCRIPTION: Places a blue line segment connecting (292, 252) to (157, 203).
; PLAN: r0=292(x1), r1=252(y1), r2=157(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 252
LDI r2, 157
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
