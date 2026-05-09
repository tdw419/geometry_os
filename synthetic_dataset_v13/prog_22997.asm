; DESCRIPTION: Places a magenta 10x91 rectangle at position (348, 134).
; PLAN: r0=348(x), r1=134(y), r2=10(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 134
LDI r2, 10
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
