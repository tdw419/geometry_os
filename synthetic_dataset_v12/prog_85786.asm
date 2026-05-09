; DESCRIPTION: Renders a black line between points (304, 137) and (195, 137).
; PLAN: r0=304(x1), r1=137(y1), r2=195(x2), r3=137(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 137
LDI r2, 195
LDI r3, 137
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
