; DESCRIPTION: Renders a yellow line between points (152, 176) and (24, 181).
; PLAN: r0=152(x1), r1=176(y1), r2=24(x2), r3=181(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 176
LDI r2, 24
LDI r3, 181
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
