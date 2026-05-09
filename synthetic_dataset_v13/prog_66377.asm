; DESCRIPTION: Draws a blue line from (492, 135) to (58, 103).
; PLAN: r0=492(x1), r1=135(y1), r2=58(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 135
LDI r2, 58
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
