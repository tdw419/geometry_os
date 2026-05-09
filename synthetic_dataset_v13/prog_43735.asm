; DESCRIPTION: Places a red line segment connecting (51, 153) to (69, 53).
; PLAN: r0=51(x1), r1=153(y1), r2=69(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 153
LDI r2, 69
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
