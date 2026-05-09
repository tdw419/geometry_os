; DESCRIPTION: Renders a green line between points (84, 176) and (160, 142).
; PLAN: r0=84(x1), r1=176(y1), r2=160(x2), r3=142(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 176
LDI r2, 160
LDI r3, 142
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
