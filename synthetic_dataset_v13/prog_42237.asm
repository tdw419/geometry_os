; DESCRIPTION: Renders a white box of size 45x16 starting at (348, 199).
; PLAN: r0=348(x), r1=199(y), r2=45(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 199
LDI r2, 45
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
