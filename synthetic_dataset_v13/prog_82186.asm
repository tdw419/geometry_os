; DESCRIPTION: Places a blue line segment connecting (195, 18) to (143, 100).
; PLAN: r0=195(x1), r1=18(y1), r2=143(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 18
LDI r2, 143
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
