; DESCRIPTION: Renders a blue line between points (255, 217) and (205, 81).
; PLAN: r0=255(x1), r1=217(y1), r2=205(x2), r3=81(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 217
LDI r2, 205
LDI r3, 81
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
