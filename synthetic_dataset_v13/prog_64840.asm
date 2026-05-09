; DESCRIPTION: Draws a yellow line from (18, 252) to (148, 160).
; PLAN: r0=18(x1), r1=252(y1), r2=148(x2), r3=160(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 252
LDI r2, 148
LDI r3, 160
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
