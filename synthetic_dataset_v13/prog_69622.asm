; DESCRIPTION: Renders a magenta box of size 69x19 starting at (199, 156).
; PLAN: r0=199(x), r1=156(y), r2=69(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 156
LDI r2, 69
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
