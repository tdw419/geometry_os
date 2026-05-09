; DESCRIPTION: Places a green line segment connecting (76, 121) to (238, 50).
; PLAN: r0=76(x1), r1=121(y1), r2=238(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 121
LDI r2, 238
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
