; DESCRIPTION: Draws a magenta rectangle at (371, 74) with width 76 and height 53.
; PLAN: r0=371(x), r1=74(y), r2=76(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 74
LDI r2, 76
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
