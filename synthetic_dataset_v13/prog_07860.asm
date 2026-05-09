; DESCRIPTION: Renders a black line between points (323, 234) and (13, 39).
; PLAN: r0=323(x1), r1=234(y1), r2=13(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 234
LDI r2, 13
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
