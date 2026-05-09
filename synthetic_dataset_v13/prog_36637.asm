; DESCRIPTION: Renders a black line between points (297, 140) and (7, 143).
; PLAN: r0=297(x1), r1=140(y1), r2=7(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 140
LDI r2, 7
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
