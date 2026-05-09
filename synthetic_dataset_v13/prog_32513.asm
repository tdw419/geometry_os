; DESCRIPTION: Renders a white line between points (417, 60) and (183, 205).
; PLAN: r0=417(x1), r1=60(y1), r2=183(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 60
LDI r2, 183
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
