; DESCRIPTION: Renders a blue line between points (148, 43) and (209, 108).
; PLAN: r0=148(x1), r1=43(y1), r2=209(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 43
LDI r2, 209
LDI r3, 108
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
