; DESCRIPTION: Renders a black line between points (225, 211) and (121, 191).
; PLAN: r0=225(x1), r1=211(y1), r2=121(x2), r3=191(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 211
LDI r2, 121
LDI r3, 191
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
