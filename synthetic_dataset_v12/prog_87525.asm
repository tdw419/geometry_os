; DESCRIPTION: Places a green line segment connecting (314, 215) to (304, 163).
; PLAN: r0=314(x1), r1=215(y1), r2=304(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 215
LDI r2, 304
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
