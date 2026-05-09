; DESCRIPTION: Renders a black line between points (246, 82) and (251, 151).
; PLAN: r0=246(x1), r1=82(y1), r2=251(x2), r3=151(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 82
LDI r2, 251
LDI r3, 151
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
