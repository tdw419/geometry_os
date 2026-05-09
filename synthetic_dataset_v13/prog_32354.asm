; DESCRIPTION: Renders a blue line between points (127, 96) and (67, 189).
; PLAN: r0=127(x1), r1=96(y1), r2=67(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 96
LDI r2, 67
LDI r3, 189
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
