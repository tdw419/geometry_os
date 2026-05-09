; DESCRIPTION: Renders a black line between points (81, 46) and (56, 121).
; PLAN: r0=81(x1), r1=46(y1), r2=56(x2), r3=121(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 46
LDI r2, 56
LDI r3, 121
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
