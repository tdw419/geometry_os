; DESCRIPTION: Renders a yellow line between points (130, 205) and (452, 62).
; PLAN: r0=130(x1), r1=205(y1), r2=452(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 205
LDI r2, 452
LDI r3, 62
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
