; DESCRIPTION: Renders a black line between points (325, 231) and (227, 188).
; PLAN: r0=325(x1), r1=231(y1), r2=227(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 231
LDI r2, 227
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
