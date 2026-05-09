; DESCRIPTION: Renders a magenta box of size 43x108 starting at (222, 61).
; PLAN: r0=222(x), r1=61(y), r2=43(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 61
LDI r2, 43
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
