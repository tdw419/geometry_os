; DESCRIPTION: Places a yellow line segment connecting (61, 222) to (468, 68).
; PLAN: r0=61(x1), r1=222(y1), r2=468(x2), r3=68(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 222
LDI r2, 468
LDI r3, 68
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
