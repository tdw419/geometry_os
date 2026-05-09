; DESCRIPTION: Renders a blue line between points (480, 240) and (366, 127).
; PLAN: r0=480(x1), r1=240(y1), r2=366(x2), r3=127(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 240
LDI r2, 366
LDI r3, 127
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
