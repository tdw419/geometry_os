; DESCRIPTION: Renders a magenta box of size 77x56 starting at (19, 133).
; PLAN: r0=19(x), r1=133(y), r2=77(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 133
LDI r2, 77
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
