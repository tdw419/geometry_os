; DESCRIPTION: Renders a black line between points (192, 126) and (441, 144).
; PLAN: r0=192(x1), r1=126(y1), r2=441(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 126
LDI r2, 441
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
