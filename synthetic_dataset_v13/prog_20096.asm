; DESCRIPTION: Places a orange line segment connecting (377, 157) to (226, 236).
; PLAN: r0=377(x1), r1=157(y1), r2=226(x2), r3=236(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 157
LDI r2, 226
LDI r3, 236
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
