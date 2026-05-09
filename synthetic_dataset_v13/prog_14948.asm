; DESCRIPTION: Places a black line segment connecting (254, 71) to (248, 179).
; PLAN: r0=254(x1), r1=71(y1), r2=248(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 71
LDI r2, 248
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
