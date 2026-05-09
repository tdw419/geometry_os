; DESCRIPTION: Renders a blue line between points (346, 108) and (149, 94).
; PLAN: r0=346(x1), r1=108(y1), r2=149(x2), r3=94(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 108
LDI r2, 149
LDI r3, 94
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
