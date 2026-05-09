; DESCRIPTION: Draws a green line from (314, 238) to (339, 89).
; PLAN: r0=314(x1), r1=238(y1), r2=339(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 238
LDI r2, 339
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
