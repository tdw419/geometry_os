; DESCRIPTION: Renders a green line between points (87, 136) and (105, 85).
; PLAN: r0=87(x1), r1=136(y1), r2=105(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 136
LDI r2, 105
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
