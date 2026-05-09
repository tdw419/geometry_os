; DESCRIPTION: Renders a purple line between points (91, 103) and (332, 184).
; PLAN: r0=91(x1), r1=103(y1), r2=332(x2), r3=184(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 103
LDI r2, 332
LDI r3, 184
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
