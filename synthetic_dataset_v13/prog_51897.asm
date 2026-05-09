; DESCRIPTION: Renders a blue line between points (89, 30) and (75, 113).
; PLAN: r0=89(x1), r1=30(y1), r2=75(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 30
LDI r2, 75
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
