; DESCRIPTION: Renders a blue line between points (381, 229) and (114, 60).
; PLAN: r0=381(x1), r1=229(y1), r2=114(x2), r3=60(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 229
LDI r2, 114
LDI r3, 60
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
