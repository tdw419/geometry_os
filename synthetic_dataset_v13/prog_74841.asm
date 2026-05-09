; DESCRIPTION: Renders a black line between points (285, 121) and (22, 83).
; PLAN: r0=285(x1), r1=121(y1), r2=22(x2), r3=83(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 121
LDI r2, 22
LDI r3, 83
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
