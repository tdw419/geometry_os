; DESCRIPTION: Renders a green line between points (404, 236) and (454, 122).
; PLAN: r0=404(x1), r1=236(y1), r2=454(x2), r3=122(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 236
LDI r2, 454
LDI r3, 122
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
