; DESCRIPTION: Places a magenta 17x116 rectangle at position (348, 37).
; PLAN: r0=348(x), r1=37(y), r2=17(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 37
LDI r2, 17
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
