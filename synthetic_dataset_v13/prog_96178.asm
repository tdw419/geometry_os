; DESCRIPTION: Renders a blue line between points (437, 102) and (416, 247).
; PLAN: r0=437(x1), r1=102(y1), r2=416(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 102
LDI r2, 416
LDI r3, 247
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
