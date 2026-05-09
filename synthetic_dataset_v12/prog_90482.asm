; DESCRIPTION: Places a black line segment connecting (38, 167) to (71, 191).
; PLAN: r0=38(x1), r1=167(y1), r2=71(x2), r3=191(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 167
LDI r2, 71
LDI r3, 191
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
