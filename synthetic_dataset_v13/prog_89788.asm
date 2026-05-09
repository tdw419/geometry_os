; DESCRIPTION: Places a yellow 93x31 rectangle at position (348, 25).
; PLAN: r0=348(x), r1=25(y), r2=93(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 25
LDI r2, 93
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
