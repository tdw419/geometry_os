; DESCRIPTION: Renders a magenta box of size 76x18 starting at (231, 17).
; PLAN: r0=231(x), r1=17(y), r2=76(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 17
LDI r2, 76
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
