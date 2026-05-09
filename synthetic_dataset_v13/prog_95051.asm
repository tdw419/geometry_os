; DESCRIPTION: Places a black line segment connecting (172, 177) to (408, 194).
; PLAN: r0=172(x1), r1=177(y1), r2=408(x2), r3=194(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 177
LDI r2, 408
LDI r3, 194
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
