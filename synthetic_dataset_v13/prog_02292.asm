; DESCRIPTION: Places a red line segment connecting (119, 126) to (128, 73).
; PLAN: r0=119(x1), r1=126(y1), r2=128(x2), r3=73(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 126
LDI r2, 128
LDI r3, 73
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
