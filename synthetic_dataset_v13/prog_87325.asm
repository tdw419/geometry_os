; DESCRIPTION: Draws a magenta rectangle at (189, 36) with width 76 and height 102.
; PLAN: r0=189(x), r1=36(y), r2=76(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 36
LDI r2, 76
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
