; DESCRIPTION: Draws a magenta rectangle at (173, 70) with width 81 and height 57.
; PLAN: r0=173(x), r1=70(y), r2=81(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 70
LDI r2, 81
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
