; DESCRIPTION: Renders a purple line between points (337, 107) and (139, 164).
; PLAN: r0=337(x1), r1=107(y1), r2=139(x2), r3=164(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 107
LDI r2, 139
LDI r3, 164
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
