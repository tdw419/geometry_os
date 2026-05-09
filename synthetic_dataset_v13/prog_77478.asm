; DESCRIPTION: Renders a purple line between points (207, 70) and (280, 159).
; PLAN: r0=207(x1), r1=70(y1), r2=280(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 70
LDI r2, 280
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
