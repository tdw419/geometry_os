; DESCRIPTION: Renders a red line between points (192, 9) and (205, 94).
; PLAN: r0=192(x1), r1=9(y1), r2=205(x2), r3=94(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 9
LDI r2, 205
LDI r3, 94
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
