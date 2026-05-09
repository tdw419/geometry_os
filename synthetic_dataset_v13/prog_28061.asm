; DESCRIPTION: Renders a green line between points (232, 131) and (504, 244).
; PLAN: r0=232(x1), r1=131(y1), r2=504(x2), r3=244(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 131
LDI r2, 504
LDI r3, 244
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
