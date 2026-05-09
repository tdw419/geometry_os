; DESCRIPTION: Places a yellow line segment connecting (201, 81) to (206, 222).
; PLAN: r0=201(x1), r1=81(y1), r2=206(x2), r3=222(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 81
LDI r2, 206
LDI r3, 222
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
