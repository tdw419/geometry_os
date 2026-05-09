; DESCRIPTION: Renders a black line between points (177, 192) and (406, 89).
; PLAN: r0=177(x1), r1=192(y1), r2=406(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 192
LDI r2, 406
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
