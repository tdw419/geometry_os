; DESCRIPTION: Renders a magenta box of size 71x76 starting at (199, 74).
; PLAN: r0=199(x), r1=74(y), r2=71(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 74
LDI r2, 71
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
