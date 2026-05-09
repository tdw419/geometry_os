; DESCRIPTION: Renders a black line between points (461, 46) and (310, 135).
; PLAN: r0=461(x1), r1=46(y1), r2=310(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 46
LDI r2, 310
LDI r3, 135
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
