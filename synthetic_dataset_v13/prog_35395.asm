; DESCRIPTION: Renders a magenta line between points (435, 83) and (419, 94).
; PLAN: r0=435(x1), r1=83(y1), r2=419(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 83
LDI r2, 419
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
