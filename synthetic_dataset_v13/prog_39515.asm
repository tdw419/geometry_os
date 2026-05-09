; DESCRIPTION: Renders a blue line between points (359, 99) and (405, 70).
; PLAN: r0=359(x1), r1=99(y1), r2=405(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 99
LDI r2, 405
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
