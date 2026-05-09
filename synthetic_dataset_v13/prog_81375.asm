; DESCRIPTION: Draws a orange rectangle at (126, 102) with width 103 and height 18.
; PLAN: r0=126(x), r1=102(y), r2=103(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 102
LDI r2, 103
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
