; DESCRIPTION: Renders a yellow line between points (424, 75) and (23, 90).
; PLAN: r0=424(x1), r1=75(y1), r2=23(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 75
LDI r2, 23
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
