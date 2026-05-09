; DESCRIPTION: Renders a black line between points (243, 104) and (341, 88).
; PLAN: r0=243(x1), r1=104(y1), r2=341(x2), r3=88(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 104
LDI r2, 341
LDI r3, 88
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
