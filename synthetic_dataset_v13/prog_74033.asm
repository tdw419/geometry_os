; DESCRIPTION: Renders a blue line between points (178, 90) and (84, 255).
; PLAN: r0=178(x1), r1=90(y1), r2=84(x2), r3=255(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 90
LDI r2, 84
LDI r3, 255
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
