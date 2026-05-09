; DESCRIPTION: Places a black line segment connecting (204, 77) to (243, 2).
; PLAN: r0=204(x1), r1=77(y1), r2=243(x2), r3=2(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 77
LDI r2, 243
LDI r3, 2
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
