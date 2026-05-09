; DESCRIPTION: Draws a green line from (404, 118) to (266, 226).
; PLAN: r0=404(x1), r1=118(y1), r2=266(x2), r3=226(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 118
LDI r2, 266
LDI r3, 226
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
