; DESCRIPTION: Renders a blue line between points (154, 230) and (136, 103).
; PLAN: r0=154(x1), r1=230(y1), r2=136(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 230
LDI r2, 136
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
