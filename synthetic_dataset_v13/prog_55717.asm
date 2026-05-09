; DESCRIPTION: Places a black line segment connecting (408, 45) to (488, 165).
; PLAN: r0=408(x1), r1=45(y1), r2=488(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 45
LDI r2, 488
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
