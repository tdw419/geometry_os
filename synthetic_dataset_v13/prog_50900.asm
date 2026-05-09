; DESCRIPTION: Draws a yellow line from (379, 23) to (470, 85).
; PLAN: r0=379(x1), r1=23(y1), r2=470(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 23
LDI r2, 470
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
