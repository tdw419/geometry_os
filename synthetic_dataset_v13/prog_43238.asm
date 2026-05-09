; DESCRIPTION: Renders a blue line between points (58, 125) and (204, 239).
; PLAN: r0=58(x1), r1=125(y1), r2=204(x2), r3=239(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 125
LDI r2, 204
LDI r3, 239
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
