; DESCRIPTION: Renders a yellow line between points (120, 232) and (434, 62).
; PLAN: r0=120(x1), r1=232(y1), r2=434(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 232
LDI r2, 434
LDI r3, 62
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
