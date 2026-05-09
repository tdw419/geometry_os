; DESCRIPTION: Places a black line segment connecting (63, 19) to (46, 227).
; PLAN: r0=63(x1), r1=19(y1), r2=46(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 19
LDI r2, 46
LDI r3, 227
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
