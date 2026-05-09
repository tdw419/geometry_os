; DESCRIPTION: Renders a black line between points (134, 9) and (365, 137).
; PLAN: r0=134(x1), r1=9(y1), r2=365(x2), r3=137(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 9
LDI r2, 365
LDI r3, 137
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
