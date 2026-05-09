; DESCRIPTION: Draws a orange rectangle at (42, 5) with width 46 and height 37.
; PLAN: r0=42(x), r1=5(y), r2=46(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 5
LDI r2, 46
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
