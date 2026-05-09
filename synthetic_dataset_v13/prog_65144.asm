; DESCRIPTION: Places a purple line segment connecting (488, 31) to (177, 142).
; PLAN: r0=488(x1), r1=31(y1), r2=177(x2), r3=142(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 31
LDI r2, 177
LDI r3, 142
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
