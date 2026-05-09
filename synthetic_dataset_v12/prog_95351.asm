; DESCRIPTION: Renders a white line between points (115, 13) and (413, 130).
; PLAN: r0=115(x1), r1=13(y1), r2=413(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 13
LDI r2, 413
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
