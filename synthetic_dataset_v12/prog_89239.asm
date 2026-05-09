; DESCRIPTION: Renders a yellow line between points (396, 83) and (350, 70).
; PLAN: r0=396(x1), r1=83(y1), r2=350(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 83
LDI r2, 350
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
