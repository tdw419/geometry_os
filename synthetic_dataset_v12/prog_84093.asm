; DESCRIPTION: Renders a green line between points (399, 224) and (363, 205).
; PLAN: r0=399(x1), r1=224(y1), r2=363(x2), r3=205(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 224
LDI r2, 363
LDI r3, 205
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
