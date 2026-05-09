; DESCRIPTION: Renders a yellow line between points (330, 192) and (43, 88).
; PLAN: r0=330(x1), r1=192(y1), r2=43(x2), r3=88(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 192
LDI r2, 43
LDI r3, 88
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
