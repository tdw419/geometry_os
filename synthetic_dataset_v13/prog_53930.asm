; DESCRIPTION: Renders a magenta box of size 114x13 starting at (32, 102).
; PLAN: r0=32(x), r1=102(y), r2=114(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 102
LDI r2, 114
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
