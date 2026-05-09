; DESCRIPTION: Places a red line segment connecting (30, 96) to (128, 214).
; PLAN: r0=30(x1), r1=96(y1), r2=128(x2), r3=214(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 96
LDI r2, 128
LDI r3, 214
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
