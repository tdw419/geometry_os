; DESCRIPTION: Renders a white line between points (176, 15) and (211, 205).
; PLAN: r0=176(x1), r1=15(y1), r2=211(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 15
LDI r2, 211
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
