; DESCRIPTION: Places a magenta 60x74 rectangle at position (348, 76).
; PLAN: r0=348(x), r1=76(y), r2=60(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 76
LDI r2, 60
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
