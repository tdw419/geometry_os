; DESCRIPTION: Places a yellow line segment connecting (296, 47) to (169, 137).
; PLAN: r0=296(x1), r1=47(y1), r2=169(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 47
LDI r2, 169
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
