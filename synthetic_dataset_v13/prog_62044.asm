; DESCRIPTION: Renders a blue line between points (70, 21) and (160, 49).
; PLAN: r0=70(x1), r1=21(y1), r2=160(x2), r3=49(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 21
LDI r2, 160
LDI r3, 49
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
