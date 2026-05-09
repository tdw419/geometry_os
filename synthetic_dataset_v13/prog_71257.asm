; DESCRIPTION: Draws a magenta rectangle at (374, 121) with width 55 and height 60.
; PLAN: r0=374(x), r1=121(y), r2=55(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 121
LDI r2, 55
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
