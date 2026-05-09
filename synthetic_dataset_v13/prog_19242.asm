; DESCRIPTION: Places a green line segment connecting (41, 236) to (333, 238).
; PLAN: r0=41(x1), r1=236(y1), r2=333(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 236
LDI r2, 333
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
