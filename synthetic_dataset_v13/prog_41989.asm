; DESCRIPTION: Places a orange 43x97 rectangle at position (348, 5).
; PLAN: r0=348(x), r1=5(y), r2=43(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 5
LDI r2, 43
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
