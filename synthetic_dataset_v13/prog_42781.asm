; DESCRIPTION: Places a yellow line segment connecting (87, 177) to (160, 85).
; PLAN: r0=87(x1), r1=177(y1), r2=160(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 177
LDI r2, 160
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
