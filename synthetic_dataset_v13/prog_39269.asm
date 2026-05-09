; DESCRIPTION: Renders a green line between points (286, 218) and (43, 147).
; PLAN: r0=286(x1), r1=218(y1), r2=43(x2), r3=147(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 218
LDI r2, 43
LDI r3, 147
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
