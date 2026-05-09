; DESCRIPTION: Renders a white line between points (222, 43) and (99, 205).
; PLAN: r0=222(x1), r1=43(y1), r2=99(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 43
LDI r2, 99
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
