; DESCRIPTION: Renders a blue line between points (276, 71) and (472, 50).
; PLAN: r0=276(x1), r1=71(y1), r2=472(x2), r3=50(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 71
LDI r2, 472
LDI r3, 50
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
