; DESCRIPTION: Places a black line segment connecting (148, 60) to (342, 165).
; PLAN: r0=148(x1), r1=60(y1), r2=342(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 60
LDI r2, 342
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
