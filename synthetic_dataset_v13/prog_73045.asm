; DESCRIPTION: Renders a blue line between points (429, 242) and (451, 222).
; PLAN: r0=429(x1), r1=242(y1), r2=451(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 242
LDI r2, 451
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
