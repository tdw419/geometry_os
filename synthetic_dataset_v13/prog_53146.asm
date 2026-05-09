; DESCRIPTION: Renders a blue line between points (28, 180) and (255, 39).
; PLAN: r0=28(x1), r1=180(y1), r2=255(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 180
LDI r2, 255
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
