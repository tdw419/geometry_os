; DESCRIPTION: Renders a magenta box of size 114x42 starting at (122, 69).
; PLAN: r0=122(x), r1=69(y), r2=114(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 69
LDI r2, 114
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
