; DESCRIPTION: Renders a blue line between points (267, 136) and (434, 40).
; PLAN: r0=267(x1), r1=136(y1), r2=434(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 136
LDI r2, 434
LDI r3, 40
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
