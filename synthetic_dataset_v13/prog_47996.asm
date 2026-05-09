; DESCRIPTION: Renders a blue line between points (460, 33) and (201, 183).
; PLAN: r0=460(x1), r1=33(y1), r2=201(x2), r3=183(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 33
LDI r2, 201
LDI r3, 183
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
