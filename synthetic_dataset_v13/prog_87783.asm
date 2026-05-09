; DESCRIPTION: Draws a blue line from (288, 1) to (404, 43).
; PLAN: r0=288(x1), r1=1(y1), r2=404(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 1
LDI r2, 404
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
