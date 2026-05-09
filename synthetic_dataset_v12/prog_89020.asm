; DESCRIPTION: Renders a blue line between points (348, 246) and (198, 211).
; PLAN: r0=348(x1), r1=246(y1), r2=198(x2), r3=211(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 246
LDI r2, 198
LDI r3, 211
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
