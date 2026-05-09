; DESCRIPTION: Renders a yellow line between points (239, 18) and (109, 130).
; PLAN: r0=239(x1), r1=18(y1), r2=109(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 18
LDI r2, 109
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
