; DESCRIPTION: Places a red line segment connecting (488, 136) to (110, 216).
; PLAN: r0=488(x1), r1=136(y1), r2=110(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 136
LDI r2, 110
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
