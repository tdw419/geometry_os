; DESCRIPTION: Draws a magenta rectangle at (209, 187) with width 30 and height 46.
; PLAN: r0=209(x), r1=187(y), r2=30(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 187
LDI r2, 30
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
