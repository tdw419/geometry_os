; DESCRIPTION: Renders a purple line between points (178, 255) and (286, 189).
; PLAN: r0=178(x1), r1=255(y1), r2=286(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 255
LDI r2, 286
LDI r3, 189
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
