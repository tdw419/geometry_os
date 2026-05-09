; DESCRIPTION: Renders a blue line between points (165, 80) and (310, 196).
; PLAN: r0=165(x1), r1=80(y1), r2=310(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 80
LDI r2, 310
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
