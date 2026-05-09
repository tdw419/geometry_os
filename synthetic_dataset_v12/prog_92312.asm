; DESCRIPTION: Renders a purple line between points (120, 235) and (160, 29).
; PLAN: r0=120(x1), r1=235(y1), r2=160(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 235
LDI r2, 160
LDI r3, 29
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
