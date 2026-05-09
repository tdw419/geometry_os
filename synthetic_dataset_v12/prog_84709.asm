; DESCRIPTION: Renders a green line between points (364, 99) and (37, 205).
; PLAN: r0=364(x1), r1=99(y1), r2=37(x2), r3=205(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 99
LDI r2, 37
LDI r3, 205
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
