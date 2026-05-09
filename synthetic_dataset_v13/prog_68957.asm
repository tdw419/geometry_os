; DESCRIPTION: Places a red line segment connecting (309, 135) to (450, 116).
; PLAN: r0=309(x1), r1=135(y1), r2=450(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 135
LDI r2, 450
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
