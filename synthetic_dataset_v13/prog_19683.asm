; DESCRIPTION: Renders a magenta box of size 38x113 starting at (348, 140).
; PLAN: r0=348(x), r1=140(y), r2=38(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 140
LDI r2, 38
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
