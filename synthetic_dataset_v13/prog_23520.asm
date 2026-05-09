; DESCRIPTION: Places a green 32x82 rectangle at position (348, 26).
; PLAN: r0=348(x), r1=26(y), r2=32(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 26
LDI r2, 32
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
