; DESCRIPTION: Places a black line segment connecting (237, 112) to (44, 83).
; PLAN: r0=237(x1), r1=112(y1), r2=44(x2), r3=83(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 112
LDI r2, 44
LDI r3, 83
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
