; DESCRIPTION: Renders a magenta box of size 42x102 starting at (29, 18).
; PLAN: r0=29(x), r1=18(y), r2=42(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 18
LDI r2, 42
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
