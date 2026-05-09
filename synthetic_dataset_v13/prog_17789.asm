; DESCRIPTION: Renders a purple line between points (214, 103) and (238, 181).
; PLAN: r0=214(x1), r1=103(y1), r2=238(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 103
LDI r2, 238
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
