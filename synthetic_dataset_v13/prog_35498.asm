; DESCRIPTION: Draws a orange rectangle at (126, 62) with width 21 and height 12.
; PLAN: r0=126(x), r1=62(y), r2=21(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 62
LDI r2, 21
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
