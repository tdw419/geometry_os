; DESCRIPTION: Renders a black line between points (291, 233) and (406, 169).
; PLAN: r0=291(x1), r1=233(y1), r2=406(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 233
LDI r2, 406
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
