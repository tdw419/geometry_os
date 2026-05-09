; DESCRIPTION: Renders a purple line between points (235, 191) and (121, 18).
; PLAN: r0=235(x1), r1=191(y1), r2=121(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 191
LDI r2, 121
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
