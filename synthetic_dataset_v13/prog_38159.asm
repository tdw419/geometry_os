; DESCRIPTION: Places a yellow line segment connecting (377, 238) to (12, 210).
; PLAN: r0=377(x1), r1=238(y1), r2=12(x2), r3=210(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 238
LDI r2, 12
LDI r3, 210
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
