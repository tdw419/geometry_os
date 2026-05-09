; DESCRIPTION: Places a green line segment connecting (218, 13) to (312, 3).
; PLAN: r0=218(x1), r1=13(y1), r2=312(x2), r3=3(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 13
LDI r2, 312
LDI r3, 3
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
