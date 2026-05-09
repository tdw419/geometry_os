; DESCRIPTION: Renders a blue line between points (431, 70) and (465, 14).
; PLAN: r0=431(x1), r1=70(y1), r2=465(x2), r3=14(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 70
LDI r2, 465
LDI r3, 14
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
