; DESCRIPTION: Renders a black line between points (198, 161) and (147, 225).
; PLAN: r0=198(x1), r1=161(y1), r2=147(x2), r3=225(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 161
LDI r2, 147
LDI r3, 225
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
