; DESCRIPTION: Renders a purple line between points (209, 235) and (108, 153).
; PLAN: r0=209(x1), r1=235(y1), r2=108(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 235
LDI r2, 108
LDI r3, 153
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
