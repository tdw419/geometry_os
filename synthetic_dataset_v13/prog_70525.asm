; DESCRIPTION: Places a red line segment connecting (434, 194) to (0, 36).
; PLAN: r0=434(x1), r1=194(y1), r2=0(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 194
LDI r2, 0
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
