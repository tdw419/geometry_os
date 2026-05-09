; DESCRIPTION: Places a green line segment connecting (9, 204) to (238, 72).
; PLAN: r0=9(x1), r1=204(y1), r2=238(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 204
LDI r2, 238
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
