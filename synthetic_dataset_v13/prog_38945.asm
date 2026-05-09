; DESCRIPTION: Places a yellow line segment connecting (501, 47) to (458, 227).
; PLAN: r0=501(x1), r1=47(y1), r2=458(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 47
LDI r2, 458
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
