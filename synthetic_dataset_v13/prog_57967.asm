; DESCRIPTION: Renders a purple line between points (103, 170) and (442, 228).
; PLAN: r0=103(x1), r1=170(y1), r2=442(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 170
LDI r2, 442
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
