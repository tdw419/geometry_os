; DESCRIPTION: Renders a purple line between points (32, 35) and (50, 170).
; PLAN: r0=32(x1), r1=35(y1), r2=50(x2), r3=170(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 35
LDI r2, 50
LDI r3, 170
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
