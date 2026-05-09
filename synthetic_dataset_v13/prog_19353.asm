; DESCRIPTION: Draws a magenta rectangle at (197, 159) with width 19 and height 91.
; PLAN: r0=197(x), r1=159(y), r2=19(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 159
LDI r2, 19
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
