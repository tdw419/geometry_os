; DESCRIPTION: Places a yellow line segment connecting (87, 12) to (377, 4).
; PLAN: r0=87(x1), r1=12(y1), r2=377(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 12
LDI r2, 377
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
