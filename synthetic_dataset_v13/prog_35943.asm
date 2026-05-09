; DESCRIPTION: Places a red line segment connecting (404, 167) to (111, 167).
; PLAN: r0=404(x1), r1=167(y1), r2=111(x2), r3=167(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 167
LDI r2, 111
LDI r3, 167
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
