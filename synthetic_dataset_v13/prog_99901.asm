; DESCRIPTION: Places a yellow line segment connecting (63, 40) to (122, 139).
; PLAN: r0=63(x1), r1=40(y1), r2=122(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 40
LDI r2, 122
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
