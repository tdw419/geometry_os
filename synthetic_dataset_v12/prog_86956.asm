; DESCRIPTION: Renders a black line between points (161, 105) and (159, 173).
; PLAN: r0=161(x1), r1=105(y1), r2=159(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 105
LDI r2, 159
LDI r3, 173
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
