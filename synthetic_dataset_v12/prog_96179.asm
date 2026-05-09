; DESCRIPTION: Renders a black line between points (433, 115) and (88, 175).
; PLAN: r0=433(x1), r1=115(y1), r2=88(x2), r3=175(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 115
LDI r2, 88
LDI r3, 175
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
