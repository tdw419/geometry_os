; DESCRIPTION: Draws a blue line from (116, 240) to (125, 69).
; PLAN: r0=116(x1), r1=240(y1), r2=125(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 240
LDI r2, 125
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
