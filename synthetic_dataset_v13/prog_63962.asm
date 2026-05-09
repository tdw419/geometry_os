; DESCRIPTION: Draws a cyan line from (404, 139) to (489, 148).
; PLAN: r0=404(x1), r1=139(y1), r2=489(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 139
LDI r2, 489
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
