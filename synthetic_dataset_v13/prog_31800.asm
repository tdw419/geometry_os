; DESCRIPTION: Places a blue line segment connecting (112, 139) to (458, 173).
; PLAN: r0=112(x1), r1=139(y1), r2=458(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 139
LDI r2, 458
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
