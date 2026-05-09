; DESCRIPTION: Places a blue line segment connecting (19, 238) to (12, 242).
; PLAN: r0=19(x1), r1=238(y1), r2=12(x2), r3=242(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 238
LDI r2, 12
LDI r3, 242
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
