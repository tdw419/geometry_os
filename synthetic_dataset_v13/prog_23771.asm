; DESCRIPTION: Renders a purple line between points (235, 102) and (210, 18).
; PLAN: r0=235(x1), r1=102(y1), r2=210(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 102
LDI r2, 210
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
