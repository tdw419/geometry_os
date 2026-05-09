; DESCRIPTION: Renders a magenta box of size 84x77 starting at (268, 101).
; PLAN: r0=268(x), r1=101(y), r2=84(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 101
LDI r2, 84
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
