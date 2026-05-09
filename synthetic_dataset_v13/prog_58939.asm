; DESCRIPTION: Renders a blue line between points (39, 18) and (165, 251).
; PLAN: r0=39(x1), r1=18(y1), r2=165(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 18
LDI r2, 165
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
