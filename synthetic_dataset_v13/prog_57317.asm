; DESCRIPTION: Renders a black line between points (469, 57) and (223, 169).
; PLAN: r0=469(x1), r1=57(y1), r2=223(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 57
LDI r2, 223
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
