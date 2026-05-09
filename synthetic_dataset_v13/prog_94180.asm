; DESCRIPTION: Places a green line segment connecting (390, 74) to (0, 182).
; PLAN: r0=390(x1), r1=74(y1), r2=0(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 74
LDI r2, 0
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
