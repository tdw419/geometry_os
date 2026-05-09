; DESCRIPTION: Places a yellow line segment connecting (361, 115) to (288, 58).
; PLAN: r0=361(x1), r1=115(y1), r2=288(x2), r3=58(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 115
LDI r2, 288
LDI r3, 58
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
