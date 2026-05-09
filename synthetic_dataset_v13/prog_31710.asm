; DESCRIPTION: Renders a yellow line between points (464, 88) and (24, 143).
; PLAN: r0=464(x1), r1=88(y1), r2=24(x2), r3=143(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 88
LDI r2, 24
LDI r3, 143
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
