; DESCRIPTION: Renders a magenta box of size 100x16 starting at (28, 239).
; PLAN: r0=28(x), r1=239(y), r2=100(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 239
LDI r2, 100
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
