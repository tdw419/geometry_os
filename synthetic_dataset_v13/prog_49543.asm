; DESCRIPTION: Draws a magenta rectangle at (346, 148) with width 57 and height 102.
; PLAN: r0=346(x), r1=148(y), r2=57(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 148
LDI r2, 57
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
