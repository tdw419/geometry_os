; DESCRIPTION: Places a black line segment connecting (293, 21) to (313, 12).
; PLAN: r0=293(x1), r1=21(y1), r2=313(x2), r3=12(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 21
LDI r2, 313
LDI r3, 12
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
