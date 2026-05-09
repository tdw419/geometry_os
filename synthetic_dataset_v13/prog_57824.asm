; DESCRIPTION: Places a black line segment connecting (417, 68) to (465, 189).
; PLAN: r0=417(x1), r1=68(y1), r2=465(x2), r3=189(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 68
LDI r2, 465
LDI r3, 189
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
