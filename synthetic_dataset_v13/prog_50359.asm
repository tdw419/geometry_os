; DESCRIPTION: Places a black 77x13 rectangle at position (348, 12).
; PLAN: r0=348(x), r1=12(y), r2=77(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 12
LDI r2, 77
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
