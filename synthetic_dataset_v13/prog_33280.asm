; DESCRIPTION: Draws a magenta rectangle at (104, 207) with width 76 and height 10.
; PLAN: r0=104(x), r1=207(y), r2=76(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 207
LDI r2, 76
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
