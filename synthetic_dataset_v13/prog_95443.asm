; DESCRIPTION: Draws a orange rectangle at (346, 62) with width 30 and height 15.
; PLAN: r0=346(x), r1=62(y), r2=30(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 62
LDI r2, 30
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
