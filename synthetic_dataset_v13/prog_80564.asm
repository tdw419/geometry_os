; DESCRIPTION: Renders a white line between points (423, 222) and (216, 235).
; PLAN: r0=423(x1), r1=222(y1), r2=216(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 222
LDI r2, 216
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
