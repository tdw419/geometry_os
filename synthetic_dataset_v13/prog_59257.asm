; DESCRIPTION: Places a magenta line segment connecting (434, 246) to (404, 95).
; PLAN: r0=434(x1), r1=246(y1), r2=404(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 246
LDI r2, 404
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
