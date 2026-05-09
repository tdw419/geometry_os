; DESCRIPTION: Renders a purple line between points (197, 28) and (506, 82).
; PLAN: r0=197(x1), r1=28(y1), r2=506(x2), r3=82(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 28
LDI r2, 506
LDI r3, 82
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
