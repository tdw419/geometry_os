; DESCRIPTION: Renders a yellow line between points (18, 226) and (282, 84).
; PLAN: r0=18(x1), r1=226(y1), r2=282(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 226
LDI r2, 282
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
