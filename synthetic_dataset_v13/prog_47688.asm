; DESCRIPTION: Renders a green line between points (151, 49) and (490, 226).
; PLAN: r0=151(x1), r1=49(y1), r2=490(x2), r3=226(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 49
LDI r2, 490
LDI r3, 226
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
