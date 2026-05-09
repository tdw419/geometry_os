; DESCRIPTION: Renders a yellow line between points (10, 30) and (90, 205).
; PLAN: r0=10(x1), r1=30(y1), r2=90(x2), r3=205(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 30
LDI r2, 90
LDI r3, 205
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
