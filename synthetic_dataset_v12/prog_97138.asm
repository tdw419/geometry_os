; DESCRIPTION: Renders a green line between points (490, 213) and (62, 212).
; PLAN: r0=490(x1), r1=213(y1), r2=62(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 213
LDI r2, 62
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
