; DESCRIPTION: Renders a green line between points (175, 62) and (158, 50).
; PLAN: r0=175(x1), r1=62(y1), r2=158(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 62
LDI r2, 158
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
