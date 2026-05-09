; DESCRIPTION: Places a black line segment connecting (248, 183) to (248, 83).
; PLAN: r0=248(x1), r1=183(y1), r2=248(x2), r3=83(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 183
LDI r2, 248
LDI r3, 83
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
