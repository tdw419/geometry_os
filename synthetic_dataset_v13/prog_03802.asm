; DESCRIPTION: Draws a magenta rectangle at (425, 187) with width 69 and height 60.
; PLAN: r0=425(x), r1=187(y), r2=69(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 187
LDI r2, 69
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
