; DESCRIPTION: Renders a purple line between points (26, 82) and (263, 189).
; PLAN: r0=26(x1), r1=82(y1), r2=263(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 82
LDI r2, 263
LDI r3, 189
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
