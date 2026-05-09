; DESCRIPTION: Draws a magenta rectangle at (213, 55) with width 86 and height 95.
; PLAN: r0=213(x), r1=55(y), r2=86(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 55
LDI r2, 86
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
