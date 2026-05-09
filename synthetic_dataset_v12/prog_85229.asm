; DESCRIPTION: Places a yellow line segment connecting (279, 83) to (85, 86).
; PLAN: r0=279(x1), r1=83(y1), r2=85(x2), r3=86(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 83
LDI r2, 85
LDI r3, 86
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
