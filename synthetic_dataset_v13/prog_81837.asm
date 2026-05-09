; DESCRIPTION: Places a black line segment connecting (500, 23) to (370, 246).
; PLAN: r0=500(x1), r1=23(y1), r2=370(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 23
LDI r2, 370
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
