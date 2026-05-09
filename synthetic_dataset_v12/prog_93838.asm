; DESCRIPTION: Draws a purple line from (502, 169) to (404, 143).
; PLAN: r0=502(x1), r1=169(y1), r2=404(x2), r3=143(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 169
LDI r2, 404
LDI r3, 143
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
