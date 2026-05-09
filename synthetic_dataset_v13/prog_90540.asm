; DESCRIPTION: Places a blue line segment connecting (281, 90) to (289, 238).
; PLAN: r0=281(x1), r1=90(y1), r2=289(x2), r3=238(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 90
LDI r2, 289
LDI r3, 238
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
