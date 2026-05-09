; DESCRIPTION: Places a purple line segment connecting (488, 29) to (417, 52).
; PLAN: r0=488(x1), r1=29(y1), r2=417(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 29
LDI r2, 417
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
