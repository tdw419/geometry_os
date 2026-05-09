; DESCRIPTION: Places a blue line segment connecting (79, 6) to (157, 39).
; PLAN: r0=79(x1), r1=6(y1), r2=157(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 6
LDI r2, 157
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
