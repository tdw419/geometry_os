; DESCRIPTION: Places a yellow line segment connecting (333, 204) to (495, 89).
; PLAN: r0=333(x1), r1=204(y1), r2=495(x2), r3=89(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 204
LDI r2, 495
LDI r3, 89
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
