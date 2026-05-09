; DESCRIPTION: Renders a purple line between points (144, 250) and (367, 12).
; PLAN: r0=144(x1), r1=250(y1), r2=367(x2), r3=12(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 250
LDI r2, 367
LDI r3, 12
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
