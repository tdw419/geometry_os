; DESCRIPTION: Places a red line segment connecting (181, 42) to (427, 90).
; PLAN: r0=181(x1), r1=42(y1), r2=427(x2), r3=90(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 42
LDI r2, 427
LDI r3, 90
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
