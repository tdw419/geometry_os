; DESCRIPTION: Draws a magenta rectangle at (373, 134) with width 53 and height 48.
; PLAN: r0=373(x), r1=134(y), r2=53(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 134
LDI r2, 53
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
