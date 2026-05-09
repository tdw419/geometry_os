; DESCRIPTION: Renders a black line between points (260, 202) and (55, 79).
; PLAN: r0=260(x1), r1=202(y1), r2=55(x2), r3=79(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 202
LDI r2, 55
LDI r3, 79
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
