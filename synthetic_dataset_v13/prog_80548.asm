; DESCRIPTION: Renders a magenta box of size 62x10 starting at (367, 102).
; PLAN: r0=367(x), r1=102(y), r2=62(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 102
LDI r2, 62
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
