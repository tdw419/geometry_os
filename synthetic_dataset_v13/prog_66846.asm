; DESCRIPTION: Renders a magenta box of size 69x14 starting at (87, 176).
; PLAN: r0=87(x), r1=176(y), r2=69(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 176
LDI r2, 69
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
