; DESCRIPTION: Renders a blue line between points (460, 188) and (59, 72).
; PLAN: r0=460(x1), r1=188(y1), r2=59(x2), r3=72(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 188
LDI r2, 59
LDI r3, 72
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
