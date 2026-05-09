; DESCRIPTION: Renders a purple line between points (492, 105) and (289, 153).
; PLAN: r0=492(x1), r1=105(y1), r2=289(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 105
LDI r2, 289
LDI r3, 153
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
