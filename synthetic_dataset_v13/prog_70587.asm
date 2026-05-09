; DESCRIPTION: Renders a purple line between points (150, 84) and (70, 40).
; PLAN: r0=150(x1), r1=84(y1), r2=70(x2), r3=40(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 84
LDI r2, 70
LDI r3, 40
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
