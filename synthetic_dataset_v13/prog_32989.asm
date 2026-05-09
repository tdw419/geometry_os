; DESCRIPTION: Places a purple line segment connecting (20, 93) to (488, 10).
; PLAN: r0=20(x1), r1=93(y1), r2=488(x2), r3=10(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 93
LDI r2, 488
LDI r3, 10
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
