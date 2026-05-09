; DESCRIPTION: Draws a yellow line from (222, 109) to (62, 142).
; PLAN: r0=222(x1), r1=109(y1), r2=62(x2), r3=142(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 109
LDI r2, 62
LDI r3, 142
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
