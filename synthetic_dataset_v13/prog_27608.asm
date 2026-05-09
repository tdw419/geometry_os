; DESCRIPTION: Renders a blue line between points (446, 5) and (371, 49).
; PLAN: r0=446(x1), r1=5(y1), r2=371(x2), r3=49(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 5
LDI r2, 371
LDI r3, 49
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
