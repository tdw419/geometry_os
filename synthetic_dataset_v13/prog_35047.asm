; DESCRIPTION: Renders a black line between points (378, 26) and (415, 74).
; PLAN: r0=378(x1), r1=26(y1), r2=415(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 26
LDI r2, 415
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
