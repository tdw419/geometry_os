; DESCRIPTION: Renders a purple line between points (29, 21) and (39, 103).
; PLAN: r0=29(x1), r1=21(y1), r2=39(x2), r3=103(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 21
LDI r2, 39
LDI r3, 103
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
