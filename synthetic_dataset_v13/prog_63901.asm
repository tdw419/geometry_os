; DESCRIPTION: Renders a blue line between points (37, 14) and (83, 195).
; PLAN: r0=37(x1), r1=14(y1), r2=83(x2), r3=195(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 14
LDI r2, 83
LDI r3, 195
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
