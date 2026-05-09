; DESCRIPTION: Draws a cyan line from (404, 105) to (413, 232).
; PLAN: r0=404(x1), r1=105(y1), r2=413(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 105
LDI r2, 413
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
