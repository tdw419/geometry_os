; DESCRIPTION: Renders a blue line between points (482, 13) and (337, 34).
; PLAN: r0=482(x1), r1=13(y1), r2=337(x2), r3=34(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 13
LDI r2, 337
LDI r3, 34
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
