; DESCRIPTION: Places a green line segment connecting (394, 165) to (287, 249).
; PLAN: r0=394(x1), r1=165(y1), r2=287(x2), r3=249(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 165
LDI r2, 287
LDI r3, 249
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
