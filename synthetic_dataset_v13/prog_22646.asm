; DESCRIPTION: Places a yellow line segment connecting (165, 13) to (201, 27).
; PLAN: r0=165(x1), r1=13(y1), r2=201(x2), r3=27(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 13
LDI r2, 201
LDI r3, 27
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
