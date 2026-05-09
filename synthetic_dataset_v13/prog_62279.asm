; DESCRIPTION: Draws a orange rectangle at (354, 43) with width 45 and height 13.
; PLAN: r0=354(x), r1=43(y), r2=45(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 43
LDI r2, 45
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
