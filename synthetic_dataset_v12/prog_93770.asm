; DESCRIPTION: Renders a black line between points (234, 83) and (309, 97).
; PLAN: r0=234(x1), r1=83(y1), r2=309(x2), r3=97(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 83
LDI r2, 309
LDI r3, 97
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
