; DESCRIPTION: Renders a purple line between points (375, 16) and (126, 122).
; PLAN: r0=375(x1), r1=16(y1), r2=126(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 16
LDI r2, 126
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
