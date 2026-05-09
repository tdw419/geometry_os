; DESCRIPTION: Draws a purple line from (125, 200) to (215, 69).
; PLAN: r0=125(x1), r1=200(y1), r2=215(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 200
LDI r2, 215
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
