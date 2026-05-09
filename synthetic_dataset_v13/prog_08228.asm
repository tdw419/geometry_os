; DESCRIPTION: Places a green line segment connecting (238, 157) to (121, 1).
; PLAN: r0=238(x1), r1=157(y1), r2=121(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 157
LDI r2, 121
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
