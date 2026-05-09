; DESCRIPTION: Places a purple line segment connecting (488, 121) to (341, 221).
; PLAN: r0=488(x1), r1=121(y1), r2=341(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 121
LDI r2, 341
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
