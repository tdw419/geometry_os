; DESCRIPTION: Renders a green line between points (211, 192) and (10, 5).
; PLAN: r0=211(x1), r1=192(y1), r2=10(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 192
LDI r2, 10
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
