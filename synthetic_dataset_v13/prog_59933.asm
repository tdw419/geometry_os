; DESCRIPTION: Renders a green line between points (424, 132) and (435, 122).
; PLAN: r0=424(x1), r1=132(y1), r2=435(x2), r3=122(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 132
LDI r2, 435
LDI r3, 122
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
