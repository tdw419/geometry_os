; DESCRIPTION: Renders a magenta box of size 101x108 starting at (18, 31).
; PLAN: r0=18(x), r1=31(y), r2=101(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 31
LDI r2, 101
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
