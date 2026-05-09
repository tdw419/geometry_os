; DESCRIPTION: Draws a purple line from (265, 76) to (30, 184).
; PLAN: r0=265(x1), r1=76(y1), r2=30(x2), r3=184(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 76
LDI r2, 30
LDI r3, 184
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
