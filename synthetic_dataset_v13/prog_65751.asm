; DESCRIPTION: Renders a blue line between points (87, 165) and (267, 100).
; PLAN: r0=87(x1), r1=165(y1), r2=267(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 165
LDI r2, 267
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
