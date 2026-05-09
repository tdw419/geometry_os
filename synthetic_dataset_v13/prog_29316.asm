; DESCRIPTION: Places a black line segment connecting (183, 112) to (300, 140).
; PLAN: r0=183(x1), r1=112(y1), r2=300(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 112
LDI r2, 300
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
