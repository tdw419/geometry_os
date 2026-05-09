; DESCRIPTION: Renders a yellow line between points (477, 157) and (113, 114).
; PLAN: r0=477(x1), r1=157(y1), r2=113(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 157
LDI r2, 113
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
