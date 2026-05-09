; DESCRIPTION: Places a blue line segment connecting (6, 202) to (238, 172).
; PLAN: r0=6(x1), r1=202(y1), r2=238(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 202
LDI r2, 238
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
