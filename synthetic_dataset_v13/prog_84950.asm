; DESCRIPTION: Places a black line segment connecting (398, 232) to (125, 92).
; PLAN: r0=398(x1), r1=232(y1), r2=125(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 232
LDI r2, 125
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
