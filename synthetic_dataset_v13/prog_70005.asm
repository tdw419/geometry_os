; DESCRIPTION: Renders a magenta box of size 93x102 starting at (209, 62).
; PLAN: r0=209(x), r1=62(y), r2=93(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 62
LDI r2, 93
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
