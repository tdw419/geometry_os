; DESCRIPTION: Renders a purple line between points (472, 199) and (267, 55).
; PLAN: r0=472(x1), r1=199(y1), r2=267(x2), r3=55(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 199
LDI r2, 267
LDI r3, 55
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
