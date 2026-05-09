; DESCRIPTION: Renders a black line between points (225, 34) and (161, 235).
; PLAN: r0=225(x1), r1=34(y1), r2=161(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 34
LDI r2, 161
LDI r3, 235
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
