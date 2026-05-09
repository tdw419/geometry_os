; DESCRIPTION: Renders a white line between points (374, 192) and (94, 54).
; PLAN: r0=374(x1), r1=192(y1), r2=94(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 192
LDI r2, 94
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
