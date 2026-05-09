; DESCRIPTION: Draws a blue line from (165, 130) to (396, 170).
; PLAN: r0=165(x1), r1=130(y1), r2=396(x2), r3=170(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 130
LDI r2, 396
LDI r3, 170
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
