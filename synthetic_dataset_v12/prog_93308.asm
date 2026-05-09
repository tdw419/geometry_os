; DESCRIPTION: Renders a blue line between points (509, 137) and (0, 235).
; PLAN: r0=509(x1), r1=137(y1), r2=0(x2), r3=235(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 137
LDI r2, 0
LDI r3, 235
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
