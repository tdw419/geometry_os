; DESCRIPTION: Draws a blue line from (246, 141) to (492, 63).
; PLAN: r0=246(x1), r1=141(y1), r2=492(x2), r3=63(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 141
LDI r2, 492
LDI r3, 63
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
