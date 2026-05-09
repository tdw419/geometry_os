; DESCRIPTION: Renders a blue line between points (462, 121) and (240, 248).
; PLAN: r0=462(x1), r1=121(y1), r2=240(x2), r3=248(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 121
LDI r2, 240
LDI r3, 248
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
