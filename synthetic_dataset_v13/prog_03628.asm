; DESCRIPTION: Places a black line segment connecting (248, 114) to (180, 140).
; PLAN: r0=248(x1), r1=114(y1), r2=180(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 114
LDI r2, 180
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
