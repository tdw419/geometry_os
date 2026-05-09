; DESCRIPTION: Renders a blue line between points (127, 84) and (16, 76).
; PLAN: r0=127(x1), r1=84(y1), r2=16(x2), r3=76(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 84
LDI r2, 16
LDI r3, 76
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
