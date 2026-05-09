; DESCRIPTION: Places a yellow line segment connecting (490, 58) to (361, 152).
; PLAN: r0=490(x1), r1=58(y1), r2=361(x2), r3=152(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 58
LDI r2, 361
LDI r3, 152
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
