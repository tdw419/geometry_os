; DESCRIPTION: Places a green line segment connecting (88, 64) to (405, 123).
; PLAN: r0=88(x1), r1=64(y1), r2=405(x2), r3=123(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 64
LDI r2, 405
LDI r3, 123
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
