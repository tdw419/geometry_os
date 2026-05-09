; DESCRIPTION: Renders a purple line between points (274, 249) and (462, 235).
; PLAN: r0=274(x1), r1=249(y1), r2=462(x2), r3=235(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 249
LDI r2, 462
LDI r3, 235
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
