; DESCRIPTION: Places a orange line segment connecting (488, 153) to (362, 80).
; PLAN: r0=488(x1), r1=153(y1), r2=362(x2), r3=80(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 153
LDI r2, 362
LDI r3, 80
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
