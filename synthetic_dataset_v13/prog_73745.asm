; DESCRIPTION: Draws a magenta line from (18, 15) to (404, 133).
; PLAN: r0=18(x1), r1=15(y1), r2=404(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 15
LDI r2, 404
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
