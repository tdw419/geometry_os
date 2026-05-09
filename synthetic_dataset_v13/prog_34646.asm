; DESCRIPTION: Places a red line segment connecting (42, 128) to (22, 116).
; PLAN: r0=42(x1), r1=128(y1), r2=22(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 128
LDI r2, 22
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
