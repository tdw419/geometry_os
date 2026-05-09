; DESCRIPTION: Places a red line segment connecting (460, 121) to (488, 100).
; PLAN: r0=460(x1), r1=121(y1), r2=488(x2), r3=100(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 121
LDI r2, 488
LDI r3, 100
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
