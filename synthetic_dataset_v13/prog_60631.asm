; DESCRIPTION: Renders a yellow line between points (316, 108) and (118, 27).
; PLAN: r0=316(x1), r1=108(y1), r2=118(x2), r3=27(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 108
LDI r2, 118
LDI r3, 27
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
