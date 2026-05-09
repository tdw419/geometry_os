; DESCRIPTION: Places a green line segment connecting (226, 155) to (241, 29).
; PLAN: r0=226(x1), r1=155(y1), r2=241(x2), r3=29(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 155
LDI r2, 241
LDI r3, 29
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
