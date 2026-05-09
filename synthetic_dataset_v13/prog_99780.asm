; DESCRIPTION: Renders a magenta box of size 43x28 starting at (430, 191).
; PLAN: r0=430(x), r1=191(y), r2=43(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 191
LDI r2, 43
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
