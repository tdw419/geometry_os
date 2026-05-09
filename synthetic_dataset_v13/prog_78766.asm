; DESCRIPTION: Draws a yellow line from (404, 19) to (35, 4).
; PLAN: r0=404(x1), r1=19(y1), r2=35(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 19
LDI r2, 35
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
