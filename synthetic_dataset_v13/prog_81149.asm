; DESCRIPTION: Places a cyan line segment connecting (268, 39) to (348, 157).
; PLAN: r0=268(x1), r1=39(y1), r2=348(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 39
LDI r2, 348
LDI r3, 157
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
