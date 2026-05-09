; DESCRIPTION: Draws a magenta rectangle at (189, 197) with width 54 and height 33.
; PLAN: r0=189(x), r1=197(y), r2=54(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 197
LDI r2, 54
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
