; DESCRIPTION: Places a magenta 21x103 rectangle at position (348, 127).
; PLAN: r0=348(x), r1=127(y), r2=21(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 127
LDI r2, 21
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
