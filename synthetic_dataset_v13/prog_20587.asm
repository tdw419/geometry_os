; DESCRIPTION: Draws a magenta rectangle at (189, 154) with width 103 and height 49.
; PLAN: r0=189(x), r1=154(y), r2=103(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 154
LDI r2, 103
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
