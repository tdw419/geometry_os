; DESCRIPTION: Draws a magenta rectangle at (383, 196) with width 95 and height 57.
; PLAN: r0=383(x), r1=196(y), r2=95(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 196
LDI r2, 95
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
