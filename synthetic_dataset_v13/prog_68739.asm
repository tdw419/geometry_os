; DESCRIPTION: Renders a yellow line between points (465, 94) and (139, 214).
; PLAN: r0=465(x1), r1=94(y1), r2=139(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 94
LDI r2, 139
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
