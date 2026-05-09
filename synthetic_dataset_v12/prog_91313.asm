; DESCRIPTION: Draws a blue line from (71, 130) to (360, 123).
; PLAN: r0=71(x1), r1=130(y1), r2=360(x2), r3=123(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 130
LDI r2, 360
LDI r3, 123
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
