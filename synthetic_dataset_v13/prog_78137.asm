; DESCRIPTION: Renders a black line between points (55, 217) and (151, 86).
; PLAN: r0=55(x1), r1=217(y1), r2=151(x2), r3=86(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 217
LDI r2, 151
LDI r3, 86
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
