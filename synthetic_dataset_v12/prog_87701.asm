; DESCRIPTION: Places a black line segment connecting (488, 79) to (118, 51).
; PLAN: r0=488(x1), r1=79(y1), r2=118(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 79
LDI r2, 118
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
