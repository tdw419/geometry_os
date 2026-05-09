; DESCRIPTION: Places a orange line segment connecting (256, 249) to (314, 16).
; PLAN: r0=256(x1), r1=249(y1), r2=314(x2), r3=16(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 249
LDI r2, 314
LDI r3, 16
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
