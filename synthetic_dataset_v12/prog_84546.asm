; DESCRIPTION: Places a blue line segment connecting (265, 26) to (212, 73).
; PLAN: r0=265(x1), r1=26(y1), r2=212(x2), r3=73(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 26
LDI r2, 212
LDI r3, 73
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
