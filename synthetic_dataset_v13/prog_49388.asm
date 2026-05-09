; DESCRIPTION: Renders a green line between points (150, 241) and (490, 149).
; PLAN: r0=150(x1), r1=241(y1), r2=490(x2), r3=149(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 241
LDI r2, 490
LDI r3, 149
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
