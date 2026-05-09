; DESCRIPTION: Renders a yellow line between points (191, 45) and (130, 198).
; PLAN: r0=191(x1), r1=45(y1), r2=130(x2), r3=198(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 45
LDI r2, 130
LDI r3, 198
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
