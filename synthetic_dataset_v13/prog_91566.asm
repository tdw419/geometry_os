; DESCRIPTION: Draws a blue line from (404, 64) to (55, 108).
; PLAN: r0=404(x1), r1=64(y1), r2=55(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 64
LDI r2, 55
LDI r3, 108
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
