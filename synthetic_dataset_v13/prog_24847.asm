; DESCRIPTION: Renders a green line between points (230, 196) and (431, 155).
; PLAN: r0=230(x1), r1=196(y1), r2=431(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 196
LDI r2, 431
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
