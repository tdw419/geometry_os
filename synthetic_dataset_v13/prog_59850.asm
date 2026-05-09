; DESCRIPTION: Places a blue line segment connecting (321, 133) to (410, 163).
; PLAN: r0=321(x1), r1=133(y1), r2=410(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 133
LDI r2, 410
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
