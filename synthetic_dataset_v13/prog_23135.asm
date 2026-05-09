; DESCRIPTION: Renders a black line between points (130, 88) and (278, 234).
; PLAN: r0=130(x1), r1=88(y1), r2=278(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 88
LDI r2, 278
LDI r3, 234
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
