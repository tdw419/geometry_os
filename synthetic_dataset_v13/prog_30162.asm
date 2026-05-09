; DESCRIPTION: Renders a blue line between points (113, 38) and (270, 194).
; PLAN: r0=113(x1), r1=38(y1), r2=270(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 38
LDI r2, 270
LDI r3, 194
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
