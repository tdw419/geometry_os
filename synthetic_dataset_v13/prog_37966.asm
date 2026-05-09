; DESCRIPTION: Places a green line segment connecting (149, 140) to (300, 109).
; PLAN: r0=149(x1), r1=140(y1), r2=300(x2), r3=109(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 140
LDI r2, 300
LDI r3, 109
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
