; DESCRIPTION: Draws a yellow line from (93, 144) to (122, 184).
; PLAN: r0=93(x1), r1=144(y1), r2=122(x2), r3=184(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 144
LDI r2, 122
LDI r3, 184
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
