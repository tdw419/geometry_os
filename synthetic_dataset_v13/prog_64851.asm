; DESCRIPTION: Renders a blue line between points (225, 108) and (498, 149).
; PLAN: r0=225(x1), r1=108(y1), r2=498(x2), r3=149(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 108
LDI r2, 498
LDI r3, 149
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
