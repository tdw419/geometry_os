; DESCRIPTION: Draws a yellow line from (128, 9) to (93, 85).
; PLAN: r0=128(x1), r1=9(y1), r2=93(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 9
LDI r2, 93
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
