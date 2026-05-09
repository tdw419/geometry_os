; DESCRIPTION: Renders a green line between points (151, 14) and (50, 155).
; PLAN: r0=151(x1), r1=14(y1), r2=50(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 14
LDI r2, 50
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
