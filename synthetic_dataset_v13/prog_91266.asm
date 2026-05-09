; DESCRIPTION: Renders a magenta box of size 19x11 starting at (173, 72).
; PLAN: r0=173(x), r1=72(y), r2=19(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 72
LDI r2, 19
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
