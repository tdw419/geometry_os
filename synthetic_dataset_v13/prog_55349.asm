; DESCRIPTION: Places a red line segment connecting (50, 65) to (157, 212).
; PLAN: r0=50(x1), r1=65(y1), r2=157(x2), r3=212(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 65
LDI r2, 157
LDI r3, 212
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
