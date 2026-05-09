; DESCRIPTION: Renders a black line between points (235, 9) and (478, 146).
; PLAN: r0=235(x1), r1=9(y1), r2=478(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 9
LDI r2, 478
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
