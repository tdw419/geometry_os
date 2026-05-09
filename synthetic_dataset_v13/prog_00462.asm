; DESCRIPTION: Draws a green line from (433, 155) to (404, 224).
; PLAN: r0=433(x1), r1=155(y1), r2=404(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 155
LDI r2, 404
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
