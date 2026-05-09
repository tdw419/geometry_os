; DESCRIPTION: Draws a magenta rectangle at (341, 126) with width 42 and height 102.
; PLAN: r0=341(x), r1=126(y), r2=42(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 126
LDI r2, 42
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
