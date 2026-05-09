; DESCRIPTION: Renders a magenta box of size 89x28 starting at (49, 212).
; PLAN: r0=49(x), r1=212(y), r2=89(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 212
LDI r2, 89
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
