; DESCRIPTION: Renders a white line between points (286, 216) and (290, 109).
; PLAN: r0=286(x1), r1=216(y1), r2=290(x2), r3=109(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 216
LDI r2, 290
LDI r3, 109
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
