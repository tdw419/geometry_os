; DESCRIPTION: Renders a purple line between points (161, 239) and (109, 122).
; PLAN: r0=161(x1), r1=239(y1), r2=109(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 239
LDI r2, 109
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
