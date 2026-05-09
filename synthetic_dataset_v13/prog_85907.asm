; DESCRIPTION: Renders a blue line between points (204, 122) and (368, 178).
; PLAN: r0=204(x1), r1=122(y1), r2=368(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 122
LDI r2, 368
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
