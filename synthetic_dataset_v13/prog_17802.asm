; DESCRIPTION: Renders a black line between points (310, 100) and (269, 161).
; PLAN: r0=310(x1), r1=100(y1), r2=269(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 100
LDI r2, 269
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
