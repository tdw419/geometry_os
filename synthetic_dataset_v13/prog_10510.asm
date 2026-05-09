; DESCRIPTION: Renders a yellow line between points (388, 55) and (490, 208).
; PLAN: r0=388(x1), r1=55(y1), r2=490(x2), r3=208(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 55
LDI r2, 490
LDI r3, 208
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
