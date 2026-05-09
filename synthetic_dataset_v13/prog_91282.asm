; DESCRIPTION: Renders a yellow line between points (304, 13) and (134, 226).
; PLAN: r0=304(x1), r1=13(y1), r2=134(x2), r3=226(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 13
LDI r2, 134
LDI r3, 226
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
