; DESCRIPTION: Draws a orange line from (350, 250) to (404, 255).
; PLAN: r0=350(x1), r1=250(y1), r2=404(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 250
LDI r2, 404
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
