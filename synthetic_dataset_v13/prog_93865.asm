; DESCRIPTION: Renders a yellow line between points (490, 241) and (60, 6).
; PLAN: r0=490(x1), r1=241(y1), r2=60(x2), r3=6(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 241
LDI r2, 60
LDI r3, 6
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
