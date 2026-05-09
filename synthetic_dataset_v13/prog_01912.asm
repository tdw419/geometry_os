; DESCRIPTION: Draws a blue line from (421, 246) to (122, 52).
; PLAN: r0=421(x1), r1=246(y1), r2=122(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 246
LDI r2, 122
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
