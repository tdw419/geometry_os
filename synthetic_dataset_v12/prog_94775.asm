; DESCRIPTION: Renders a magenta box of size 58x83 starting at (396, 122).
; PLAN: r0=396(x), r1=122(y), r2=58(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 122
LDI r2, 58
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
