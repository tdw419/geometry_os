; DESCRIPTION: Renders a black line between points (115, 76) and (495, 148).
; PLAN: r0=115(x1), r1=76(y1), r2=495(x2), r3=148(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 76
LDI r2, 495
LDI r3, 148
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
