; DESCRIPTION: Renders a black line between points (300, 143) and (315, 232).
; PLAN: r0=300(x1), r1=143(y1), r2=315(x2), r3=232(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 143
LDI r2, 315
LDI r3, 232
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
