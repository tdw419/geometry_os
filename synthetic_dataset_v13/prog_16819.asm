; DESCRIPTION: Renders a black line between points (219, 79) and (177, 0).
; PLAN: r0=219(x1), r1=79(y1), r2=177(x2), r3=0(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 79
LDI r2, 177
LDI r3, 0
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
