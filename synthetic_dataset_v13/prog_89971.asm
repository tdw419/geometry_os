; DESCRIPTION: Renders a blue line between points (227, 117) and (209, 53).
; PLAN: r0=227(x1), r1=117(y1), r2=209(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 117
LDI r2, 209
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
