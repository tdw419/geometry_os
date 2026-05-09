; DESCRIPTION: Draws a red rectangle at (397, 100) with width 16 and height 63.
; PLAN: r0=397(x), r1=100(y), r2=16(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 100
LDI r2, 16
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
