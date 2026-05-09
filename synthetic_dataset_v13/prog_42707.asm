; DESCRIPTION: Renders a yellow line between points (68, 39) and (299, 147).
; PLAN: r0=68(x1), r1=39(y1), r2=299(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 39
LDI r2, 299
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
