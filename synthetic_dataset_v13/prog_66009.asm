; DESCRIPTION: Renders a purple line between points (161, 143) and (226, 254).
; PLAN: r0=161(x1), r1=143(y1), r2=226(x2), r3=254(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 143
LDI r2, 226
LDI r3, 254
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
