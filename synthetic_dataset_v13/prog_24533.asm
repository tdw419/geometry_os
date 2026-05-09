; DESCRIPTION: Draws a magenta rectangle at (333, 117) with width 14 and height 74.
; PLAN: r0=333(x), r1=117(y), r2=14(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 117
LDI r2, 14
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
