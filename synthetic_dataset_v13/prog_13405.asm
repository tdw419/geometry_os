; DESCRIPTION: Renders a blue line between points (319, 126) and (195, 139).
; PLAN: r0=319(x1), r1=126(y1), r2=195(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 126
LDI r2, 195
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
