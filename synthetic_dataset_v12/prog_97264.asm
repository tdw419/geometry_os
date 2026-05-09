; DESCRIPTION: Places a black line segment connecting (362, 203) to (153, 69).
; PLAN: r0=362(x1), r1=203(y1), r2=153(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 203
LDI r2, 153
LDI r3, 69
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
