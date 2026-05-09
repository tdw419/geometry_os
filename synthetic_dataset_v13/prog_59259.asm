; DESCRIPTION: Renders a black line between points (161, 20) and (142, 39).
; PLAN: r0=161(x1), r1=20(y1), r2=142(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 20
LDI r2, 142
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
