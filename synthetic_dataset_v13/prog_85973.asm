; DESCRIPTION: Draws a blue line from (44, 115) to (274, 74).
; PLAN: r0=44(x1), r1=115(y1), r2=274(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 115
LDI r2, 274
LDI r3, 74
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
