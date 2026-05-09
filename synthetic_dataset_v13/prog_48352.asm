; DESCRIPTION: Renders a magenta box of size 18x23 starting at (177, 62).
; PLAN: r0=177(x), r1=62(y), r2=18(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 62
LDI r2, 18
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
