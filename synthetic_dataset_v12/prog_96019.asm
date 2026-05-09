; DESCRIPTION: Places a green line segment connecting (404, 63) to (76, 75).
; PLAN: r0=404(x1), r1=63(y1), r2=76(x2), r3=75(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 63
LDI r2, 76
LDI r3, 75
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
