; DESCRIPTION: Renders a black line between points (461, 161) and (17, 219).
; PLAN: r0=461(x1), r1=161(y1), r2=17(x2), r3=219(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 161
LDI r2, 17
LDI r3, 219
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
