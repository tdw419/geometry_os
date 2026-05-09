; DESCRIPTION: Renders a blue line between points (255, 132) and (447, 17).
; PLAN: r0=255(x1), r1=132(y1), r2=447(x2), r3=17(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 132
LDI r2, 447
LDI r3, 17
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
