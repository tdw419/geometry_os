; DESCRIPTION: Places a black line segment connecting (462, 165) to (44, 140).
; PLAN: r0=462(x1), r1=165(y1), r2=44(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 165
LDI r2, 44
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
