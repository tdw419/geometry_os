; DESCRIPTION: Renders a magenta box of size 42x88 starting at (40, 11).
; PLAN: r0=40(x), r1=11(y), r2=42(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 11
LDI r2, 42
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
