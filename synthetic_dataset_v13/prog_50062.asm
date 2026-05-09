; DESCRIPTION: Places a yellow line segment connecting (205, 119) to (464, 2).
; PLAN: r0=205(x1), r1=119(y1), r2=464(x2), r3=2(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 119
LDI r2, 464
LDI r3, 2
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
