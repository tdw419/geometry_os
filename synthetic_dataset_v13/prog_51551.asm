; DESCRIPTION: Draws a magenta rectangle at (299, 68) with width 41 and height 104.
; PLAN: r0=299(x), r1=68(y), r2=41(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 68
LDI r2, 41
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
