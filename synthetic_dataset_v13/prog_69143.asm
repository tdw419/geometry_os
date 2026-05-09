; DESCRIPTION: Places a red line segment connecting (404, 27) to (150, 106).
; PLAN: r0=404(x1), r1=27(y1), r2=150(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 27
LDI r2, 150
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
