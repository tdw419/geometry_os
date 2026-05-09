; DESCRIPTION: Renders a yellow line between points (62, 202) and (444, 189).
; PLAN: r0=62(x1), r1=202(y1), r2=444(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 202
LDI r2, 444
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
