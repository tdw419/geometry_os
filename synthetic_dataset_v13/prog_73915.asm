; DESCRIPTION: Renders a blue line between points (164, 199) and (499, 59).
; PLAN: r0=164(x1), r1=199(y1), r2=499(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 199
LDI r2, 499
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
