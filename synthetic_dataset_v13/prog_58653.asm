; DESCRIPTION: Places a cyan line segment connecting (348, 42) to (388, 74).
; PLAN: r0=348(x1), r1=42(y1), r2=388(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 42
LDI r2, 388
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
