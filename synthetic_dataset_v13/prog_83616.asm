; DESCRIPTION: Draws a magenta rectangle at (320, 11) with width 93 and height 83.
; PLAN: r0=320(x), r1=11(y), r2=93(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 11
LDI r2, 93
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
