; DESCRIPTION: Draws a magenta rectangle at (320, 221) with width 96 and height 34.
; PLAN: r0=320(x), r1=221(y), r2=96(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 221
LDI r2, 96
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
