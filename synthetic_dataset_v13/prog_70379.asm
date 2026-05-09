; DESCRIPTION: Places a black line segment connecting (414, 232) to (44, 174).
; PLAN: r0=414(x1), r1=232(y1), r2=44(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 232
LDI r2, 44
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
