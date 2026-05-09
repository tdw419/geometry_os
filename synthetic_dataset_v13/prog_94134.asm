; DESCRIPTION: Places a magenta line segment connecting (157, 16) to (149, 96).
; PLAN: r0=157(x1), r1=16(y1), r2=149(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 16
LDI r2, 149
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
