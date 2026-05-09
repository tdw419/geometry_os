; DESCRIPTION: Draws a yellow line from (273, 14) to (18, 148).
; PLAN: r0=273(x1), r1=14(y1), r2=18(x2), r3=148(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 14
LDI r2, 18
LDI r3, 148
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
