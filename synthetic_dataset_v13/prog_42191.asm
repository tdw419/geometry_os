; DESCRIPTION: Renders a purple line between points (341, 221) and (315, 239).
; PLAN: r0=341(x1), r1=221(y1), r2=315(x2), r3=239(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 221
LDI r2, 315
LDI r3, 239
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
