; DESCRIPTION: Places a green line segment connecting (353, 238) to (214, 35).
; PLAN: r0=353(x1), r1=238(y1), r2=214(x2), r3=35(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 238
LDI r2, 214
LDI r3, 35
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
