; DESCRIPTION: Renders a purple line between points (240, 187) and (341, 143).
; PLAN: r0=240(x1), r1=187(y1), r2=341(x2), r3=143(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 187
LDI r2, 341
LDI r3, 143
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
