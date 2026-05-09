; DESCRIPTION: Renders a purple line between points (145, 107) and (239, 35).
; PLAN: r0=145(x1), r1=107(y1), r2=239(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 107
LDI r2, 239
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
