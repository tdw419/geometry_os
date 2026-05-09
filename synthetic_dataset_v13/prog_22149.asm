; DESCRIPTION: Renders a blue line between points (281, 220) and (93, 189).
; PLAN: r0=281(x1), r1=220(y1), r2=93(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 220
LDI r2, 93
LDI r3, 189
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
