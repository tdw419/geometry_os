; DESCRIPTION: Places a red line segment connecting (404, 247) to (148, 128).
; PLAN: r0=404(x1), r1=247(y1), r2=148(x2), r3=128(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 247
LDI r2, 148
LDI r3, 128
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
