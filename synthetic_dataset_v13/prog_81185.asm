; DESCRIPTION: Renders a black line between points (485, 227) and (186, 58).
; PLAN: r0=485(x1), r1=227(y1), r2=186(x2), r3=58(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 227
LDI r2, 186
LDI r3, 58
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
