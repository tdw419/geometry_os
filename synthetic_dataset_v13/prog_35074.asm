; DESCRIPTION: Draws a yellow line from (144, 127) to (507, 168).
; PLAN: r0=144(x1), r1=127(y1), r2=507(x2), r3=168(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 127
LDI r2, 507
LDI r3, 168
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
