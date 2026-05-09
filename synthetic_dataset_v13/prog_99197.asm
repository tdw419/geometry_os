; DESCRIPTION: Renders a green line between points (404, 68) and (477, 234).
; PLAN: r0=404(x1), r1=68(y1), r2=477(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 68
LDI r2, 477
LDI r3, 234
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
