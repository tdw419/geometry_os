; DESCRIPTION: Draws a red rectangle at (134, 85) with width 64 and height 63.
; PLAN: r0=134(x), r1=85(y), r2=64(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 85
LDI r2, 64
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
