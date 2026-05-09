; DESCRIPTION: Draws a yellow line from (87, 0) to (302, 58).
; PLAN: r0=87(x1), r1=0(y1), r2=302(x2), r3=58(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 0
LDI r2, 302
LDI r3, 58
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
