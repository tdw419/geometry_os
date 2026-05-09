; DESCRIPTION: Draws a magenta rectangle at (25, 187) with width 27 and height 39.
; PLAN: r0=25(x), r1=187(y), r2=27(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 187
LDI r2, 27
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
