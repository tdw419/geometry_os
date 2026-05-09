; DESCRIPTION: Draws a purple line from (261, 55) to (148, 173).
; PLAN: r0=261(x1), r1=55(y1), r2=148(x2), r3=173(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 55
LDI r2, 148
LDI r3, 173
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
