; DESCRIPTION: Draws a magenta rectangle at (276, 128) with width 120 and height 113.
; PLAN: r0=276(x), r1=128(y), r2=120(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 128
LDI r2, 120
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
