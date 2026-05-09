; DESCRIPTION: Places a orange line segment connecting (488, 49) to (174, 109).
; PLAN: r0=488(x1), r1=49(y1), r2=174(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 49
LDI r2, 174
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
