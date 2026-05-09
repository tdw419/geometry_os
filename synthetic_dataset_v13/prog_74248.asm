; DESCRIPTION: Places a black line segment connecting (181, 83) to (46, 8).
; PLAN: r0=181(x1), r1=83(y1), r2=46(x2), r3=8(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 83
LDI r2, 46
LDI r3, 8
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
