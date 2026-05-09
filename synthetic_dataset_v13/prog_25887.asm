; DESCRIPTION: Places a blue line segment connecting (119, 177) to (1, 173).
; PLAN: r0=119(x1), r1=177(y1), r2=1(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 177
LDI r2, 1
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
