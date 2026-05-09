; DESCRIPTION: Draws a green line from (145, 42) to (348, 31).
; PLAN: r0=145(x1), r1=42(y1), r2=348(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 42
LDI r2, 348
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
