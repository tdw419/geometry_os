; DESCRIPTION: Places a orange 75x35 rectangle at position (348, 13).
; PLAN: r0=348(x), r1=13(y), r2=75(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 13
LDI r2, 75
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
