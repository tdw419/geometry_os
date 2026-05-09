; DESCRIPTION: Renders a purple line between points (18, 142) and (320, 93).
; PLAN: r0=18(x1), r1=142(y1), r2=320(x2), r3=93(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 142
LDI r2, 320
LDI r3, 93
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
