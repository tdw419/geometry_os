; DESCRIPTION: Renders a black line between points (116, 22) and (12, 15).
; PLAN: r0=116(x1), r1=22(y1), r2=12(x2), r3=15(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 22
LDI r2, 12
LDI r3, 15
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
