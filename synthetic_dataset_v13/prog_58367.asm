; DESCRIPTION: Renders a yellow line between points (338, 5) and (338, 159).
; PLAN: r0=338(x1), r1=5(y1), r2=338(x2), r3=159(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 5
LDI r2, 338
LDI r3, 159
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
