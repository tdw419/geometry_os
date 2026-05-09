; DESCRIPTION: Renders a yellow line between points (131, 249) and (303, 245).
; PLAN: r0=131(x1), r1=249(y1), r2=303(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 249
LDI r2, 303
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
