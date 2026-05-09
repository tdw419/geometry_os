; DESCRIPTION: Draws a magenta rectangle at (154, 164) with width 25 and height 17.
; PLAN: r0=154(x), r1=164(y), r2=25(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 164
LDI r2, 25
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
