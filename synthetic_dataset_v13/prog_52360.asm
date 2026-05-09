; DESCRIPTION: Renders a magenta box of size 43x114 starting at (334, 36).
; PLAN: r0=334(x), r1=36(y), r2=43(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 36
LDI r2, 43
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
