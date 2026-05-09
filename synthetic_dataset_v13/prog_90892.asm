; DESCRIPTION: Places a yellow line segment connecting (459, 97) to (502, 100).
; PLAN: r0=459(x1), r1=97(y1), r2=502(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 97
LDI r2, 502
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
