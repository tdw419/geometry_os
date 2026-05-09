; DESCRIPTION: Places a black line segment connecting (218, 19) to (370, 11).
; PLAN: r0=218(x1), r1=19(y1), r2=370(x2), r3=11(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 19
LDI r2, 370
LDI r3, 11
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
