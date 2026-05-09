; DESCRIPTION: Places a yellow line segment connecting (116, 63) to (404, 160).
; PLAN: r0=116(x1), r1=63(y1), r2=404(x2), r3=160(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 63
LDI r2, 404
LDI r3, 160
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
