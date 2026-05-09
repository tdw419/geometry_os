; DESCRIPTION: Renders a magenta box of size 69x96 starting at (151, 96).
; PLAN: r0=151(x), r1=96(y), r2=69(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 96
LDI r2, 69
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
