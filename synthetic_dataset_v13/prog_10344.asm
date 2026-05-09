; DESCRIPTION: Creates a orange rectangular region at (348, 30) spanning 109 by 20 pixels.
; PLAN: r0=348(x), r1=30(y), r2=109(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 30
LDI r2, 109
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
