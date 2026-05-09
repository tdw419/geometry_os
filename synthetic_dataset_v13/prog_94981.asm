; DESCRIPTION: Renders a purple line between points (82, 143) and (172, 108).
; PLAN: r0=82(x1), r1=143(y1), r2=172(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 143
LDI r2, 172
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
