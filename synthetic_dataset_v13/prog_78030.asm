; DESCRIPTION: Renders a blue line between points (117, 64) and (246, 114).
; PLAN: r0=117(x1), r1=64(y1), r2=246(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 64
LDI r2, 246
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
