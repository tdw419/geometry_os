; DESCRIPTION: Draws a yellow line from (58, 154) to (282, 23).
; PLAN: r0=58(x1), r1=154(y1), r2=282(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 154
LDI r2, 282
LDI r3, 23
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
