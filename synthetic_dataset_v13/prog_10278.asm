; DESCRIPTION: Renders a white line between points (136, 143) and (385, 51).
; PLAN: r0=136(x1), r1=143(y1), r2=385(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 143
LDI r2, 385
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
