; DESCRIPTION: Renders a blue line between points (219, 166) and (217, 118).
; PLAN: r0=219(x1), r1=166(y1), r2=217(x2), r3=118(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 166
LDI r2, 217
LDI r3, 118
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
