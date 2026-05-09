; DESCRIPTION: Renders a purple line between points (195, 76) and (502, 232).
; PLAN: r0=195(x1), r1=76(y1), r2=502(x2), r3=232(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 76
LDI r2, 502
LDI r3, 232
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
