; DESCRIPTION: Renders a purple line between points (195, 132) and (441, 192).
; PLAN: r0=195(x1), r1=132(y1), r2=441(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 132
LDI r2, 441
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
