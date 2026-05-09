; DESCRIPTION: Places a green line segment connecting (273, 2) to (333, 249).
; PLAN: r0=273(x1), r1=2(y1), r2=333(x2), r3=249(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 2
LDI r2, 333
LDI r3, 249
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
