; DESCRIPTION: Renders a black line between points (430, 231) and (199, 227).
; PLAN: r0=430(x1), r1=231(y1), r2=199(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 231
LDI r2, 199
LDI r3, 227
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
