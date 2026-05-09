; DESCRIPTION: Places a black line segment connecting (172, 45) to (153, 179).
; PLAN: r0=172(x1), r1=45(y1), r2=153(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 45
LDI r2, 153
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
