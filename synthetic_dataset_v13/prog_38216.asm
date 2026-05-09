; DESCRIPTION: Renders a magenta box of size 78x78 starting at (122, 126).
; PLAN: r0=122(x), r1=126(y), r2=78(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 126
LDI r2, 78
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
