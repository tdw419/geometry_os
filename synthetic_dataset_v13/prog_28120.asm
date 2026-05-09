; DESCRIPTION: Places a black line segment connecting (275, 28) to (506, 4).
; PLAN: r0=275(x1), r1=28(y1), r2=506(x2), r3=4(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 28
LDI r2, 506
LDI r3, 4
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
