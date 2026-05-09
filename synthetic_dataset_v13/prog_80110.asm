; DESCRIPTION: Renders a blue line between points (425, 232) and (393, 108).
; PLAN: r0=425(x1), r1=232(y1), r2=393(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 232
LDI r2, 393
LDI r3, 108
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
