; DESCRIPTION: Draws a blue line from (456, 63) to (404, 99).
; PLAN: r0=456(x1), r1=63(y1), r2=404(x2), r3=99(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 63
LDI r2, 404
LDI r3, 99
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
