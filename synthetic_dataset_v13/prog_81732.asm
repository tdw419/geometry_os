; DESCRIPTION: Places a red line segment connecting (414, 10) to (404, 30).
; PLAN: r0=414(x1), r1=10(y1), r2=404(x2), r3=30(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 10
LDI r2, 404
LDI r3, 30
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
