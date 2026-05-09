; DESCRIPTION: Draws a green rectangle at (384, 60) with width 43 and height 23.
; PLAN: r0=384(x), r1=60(y), r2=43(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 60
LDI r2, 43
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
