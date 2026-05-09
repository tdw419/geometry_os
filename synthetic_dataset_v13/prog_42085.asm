; DESCRIPTION: Renders a yellow line between points (442, 154) and (273, 101).
; PLAN: r0=442(x1), r1=154(y1), r2=273(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 154
LDI r2, 273
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
