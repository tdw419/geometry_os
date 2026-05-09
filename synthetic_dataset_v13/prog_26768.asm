; DESCRIPTION: Renders a purple line between points (174, 150) and (112, 53).
; PLAN: r0=174(x1), r1=150(y1), r2=112(x2), r3=53(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 150
LDI r2, 112
LDI r3, 53
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
