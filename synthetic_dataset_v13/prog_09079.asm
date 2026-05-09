; DESCRIPTION: Renders a purple line between points (102, 179) and (303, 251).
; PLAN: r0=102(x1), r1=179(y1), r2=303(x2), r3=251(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 179
LDI r2, 303
LDI r3, 251
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
