; DESCRIPTION: Renders a magenta box of size 58x73 starting at (199, 69).
; PLAN: r0=199(x), r1=69(y), r2=58(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 69
LDI r2, 58
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
