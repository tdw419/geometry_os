; DESCRIPTION: Renders a blue line between points (102, 103) and (19, 188).
; PLAN: r0=102(x1), r1=103(y1), r2=19(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 103
LDI r2, 19
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
