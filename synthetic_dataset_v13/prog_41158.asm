; DESCRIPTION: Places a black line segment connecting (423, 243) to (399, 39).
; PLAN: r0=423(x1), r1=243(y1), r2=399(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 243
LDI r2, 399
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
