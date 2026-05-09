; DESCRIPTION: Places a black line segment connecting (408, 33) to (253, 2).
; PLAN: r0=408(x1), r1=33(y1), r2=253(x2), r3=2(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 33
LDI r2, 253
LDI r3, 2
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
