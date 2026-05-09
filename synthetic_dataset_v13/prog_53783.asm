; DESCRIPTION: Places a blue line segment connecting (151, 131) to (352, 121).
; PLAN: r0=151(x1), r1=131(y1), r2=352(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 131
LDI r2, 352
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
