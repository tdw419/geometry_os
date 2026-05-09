; DESCRIPTION: Draws a blue line from (385, 173) to (455, 245).
; PLAN: r0=385(x1), r1=173(y1), r2=455(x2), r3=245(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 173
LDI r2, 455
LDI r3, 245
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
