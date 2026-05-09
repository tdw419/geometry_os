; DESCRIPTION: Draws a blue line from (283, 130) to (200, 169).
; PLAN: r0=283(x1), r1=130(y1), r2=200(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 130
LDI r2, 200
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
