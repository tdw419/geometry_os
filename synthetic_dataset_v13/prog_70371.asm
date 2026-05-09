; DESCRIPTION: Draws a orange rectangle at (376, 134) with width 111 and height 66.
; PLAN: r0=376(x), r1=134(y), r2=111(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 134
LDI r2, 111
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
