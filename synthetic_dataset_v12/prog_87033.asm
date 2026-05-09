; DESCRIPTION: Renders a magenta box of size 77x71 starting at (138, 67).
; PLAN: r0=138(x), r1=67(y), r2=77(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 67
LDI r2, 77
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
