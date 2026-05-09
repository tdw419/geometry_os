; DESCRIPTION: Places a black line segment connecting (108, 163) to (500, 229).
; PLAN: r0=108(x1), r1=163(y1), r2=500(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 163
LDI r2, 500
LDI r3, 229
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
