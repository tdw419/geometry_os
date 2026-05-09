; DESCRIPTION: Places a red line segment connecting (0, 42) to (452, 35).
; PLAN: r0=0(x1), r1=42(y1), r2=452(x2), r3=35(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 42
LDI r2, 452
LDI r3, 35
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
