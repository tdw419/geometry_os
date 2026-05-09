; DESCRIPTION: Renders a black line between points (378, 46) and (116, 206).
; PLAN: r0=378(x1), r1=46(y1), r2=116(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 46
LDI r2, 116
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
