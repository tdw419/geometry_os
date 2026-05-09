; DESCRIPTION: Renders a yellow line between points (323, 26) and (290, 117).
; PLAN: r0=323(x1), r1=26(y1), r2=290(x2), r3=117(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 26
LDI r2, 290
LDI r3, 117
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
