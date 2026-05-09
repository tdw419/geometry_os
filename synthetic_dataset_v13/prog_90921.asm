; DESCRIPTION: Renders a purple line between points (94, 151) and (154, 199).
; PLAN: r0=94(x1), r1=151(y1), r2=154(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 151
LDI r2, 154
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
