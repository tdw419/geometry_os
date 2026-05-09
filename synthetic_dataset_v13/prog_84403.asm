; DESCRIPTION: Places a black line segment connecting (86, 87) to (488, 17).
; PLAN: r0=86(x1), r1=87(y1), r2=488(x2), r3=17(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 87
LDI r2, 488
LDI r3, 17
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
