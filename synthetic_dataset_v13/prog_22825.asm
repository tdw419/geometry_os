; DESCRIPTION: Renders a red line between points (205, 40) and (258, 191).
; PLAN: r0=205(x1), r1=40(y1), r2=258(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 40
LDI r2, 258
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
