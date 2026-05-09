; DESCRIPTION: Draws a yellow line from (226, 85) to (50, 149).
; PLAN: r0=226(x1), r1=85(y1), r2=50(x2), r3=149(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 85
LDI r2, 50
LDI r3, 149
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
