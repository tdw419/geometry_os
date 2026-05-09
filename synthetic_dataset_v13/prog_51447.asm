; DESCRIPTION: Draws a red line from (404, 111) to (19, 98).
; PLAN: r0=404(x1), r1=111(y1), r2=19(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 111
LDI r2, 19
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
