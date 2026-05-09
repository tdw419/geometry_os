; DESCRIPTION: Places a blue line segment connecting (222, 177) to (324, 29).
; PLAN: r0=222(x1), r1=177(y1), r2=324(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 177
LDI r2, 324
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
