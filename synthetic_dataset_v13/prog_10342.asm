; DESCRIPTION: Renders a magenta box of size 76x15 starting at (102, 9).
; PLAN: r0=102(x), r1=9(y), r2=76(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 9
LDI r2, 76
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
