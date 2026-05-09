; DESCRIPTION: Draws a red line from (404, 205) to (423, 24).
; PLAN: r0=404(x1), r1=205(y1), r2=423(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 205
LDI r2, 423
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
