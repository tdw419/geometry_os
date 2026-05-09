; DESCRIPTION: Places a red line segment connecting (42, 24) to (261, 179).
; PLAN: r0=42(x1), r1=24(y1), r2=261(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 24
LDI r2, 261
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
