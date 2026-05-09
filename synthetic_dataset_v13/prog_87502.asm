; DESCRIPTION: Draws a yellow line from (222, 133) to (27, 29).
; PLAN: r0=222(x1), r1=133(y1), r2=27(x2), r3=29(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 133
LDI r2, 27
LDI r3, 29
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
