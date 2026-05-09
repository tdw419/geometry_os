; DESCRIPTION: Places a white 78x52 rectangle at position (348, 68).
; PLAN: r0=348(x), r1=68(y), r2=78(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 68
LDI r2, 78
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
