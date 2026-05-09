; DESCRIPTION: Renders a blue line between points (328, 254) and (232, 107).
; PLAN: r0=328(x1), r1=254(y1), r2=232(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 254
LDI r2, 232
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
