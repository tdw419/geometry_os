; DESCRIPTION: Renders a black line between points (191, 206) and (185, 252).
; PLAN: r0=191(x1), r1=206(y1), r2=185(x2), r3=252(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 206
LDI r2, 185
LDI r3, 252
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
