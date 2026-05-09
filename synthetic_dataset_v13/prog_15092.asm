; DESCRIPTION: Places a orange 119x85 rectangle at position (348, 67).
; PLAN: r0=348(x), r1=67(y), r2=119(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 67
LDI r2, 119
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
