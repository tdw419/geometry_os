; DESCRIPTION: Draws a green line from (404, 80) to (264, 90).
; PLAN: r0=404(x1), r1=80(y1), r2=264(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 80
LDI r2, 264
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
