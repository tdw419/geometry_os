; DESCRIPTION: Renders a blue line between points (267, 25) and (28, 251).
; PLAN: r0=267(x1), r1=25(y1), r2=28(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 25
LDI r2, 28
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
