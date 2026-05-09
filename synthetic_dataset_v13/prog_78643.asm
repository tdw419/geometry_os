; DESCRIPTION: Renders a yellow line between points (439, 71) and (192, 162).
; PLAN: r0=439(x1), r1=71(y1), r2=192(x2), r3=162(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 71
LDI r2, 192
LDI r3, 162
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
