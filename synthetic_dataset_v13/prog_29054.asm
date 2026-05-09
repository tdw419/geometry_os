; DESCRIPTION: Renders a yellow line between points (268, 249) and (457, 20).
; PLAN: r0=268(x1), r1=249(y1), r2=457(x2), r3=20(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 249
LDI r2, 457
LDI r3, 20
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
