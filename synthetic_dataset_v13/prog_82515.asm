; DESCRIPTION: Draws a orange rectangle at (166, 116) with width 101 and height 42.
; PLAN: r0=166(x), r1=116(y), r2=101(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 116
LDI r2, 101
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
