; DESCRIPTION: Places a black line segment connecting (24, 60) to (142, 208).
; PLAN: r0=24(x1), r1=60(y1), r2=142(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 60
LDI r2, 142
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
