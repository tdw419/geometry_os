; DESCRIPTION: Places a black line segment connecting (264, 34) to (423, 26).
; PLAN: r0=264(x1), r1=34(y1), r2=423(x2), r3=26(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 34
LDI r2, 423
LDI r3, 26
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
