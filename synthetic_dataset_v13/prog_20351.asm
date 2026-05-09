; DESCRIPTION: Renders a magenta box of size 106x42 starting at (348, 88).
; PLAN: r0=348(x), r1=88(y), r2=106(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 88
LDI r2, 106
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
