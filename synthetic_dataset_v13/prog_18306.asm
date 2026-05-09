; DESCRIPTION: Renders a magenta box of size 37x10 starting at (101, 139).
; PLAN: r0=101(x), r1=139(y), r2=37(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 139
LDI r2, 37
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
