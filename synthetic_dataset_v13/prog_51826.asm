; DESCRIPTION: Draws a magenta rectangle at (173, 152) with width 101 and height 97.
; PLAN: r0=173(x), r1=152(y), r2=101(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 152
LDI r2, 101
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
