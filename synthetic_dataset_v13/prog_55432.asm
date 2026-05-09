; DESCRIPTION: Renders a yellow line between points (314, 166) and (394, 206).
; PLAN: r0=314(x1), r1=166(y1), r2=394(x2), r3=206(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 166
LDI r2, 394
LDI r3, 206
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
