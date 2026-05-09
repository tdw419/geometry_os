; DESCRIPTION: Places a black line segment connecting (420, 232) to (39, 112).
; PLAN: r0=420(x1), r1=232(y1), r2=39(x2), r3=112(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 232
LDI r2, 39
LDI r3, 112
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
