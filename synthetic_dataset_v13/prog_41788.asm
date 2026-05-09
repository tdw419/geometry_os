; DESCRIPTION: Renders a blue line between points (267, 211) and (25, 180).
; PLAN: r0=267(x1), r1=211(y1), r2=25(x2), r3=180(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 211
LDI r2, 25
LDI r3, 180
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
