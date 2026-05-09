; DESCRIPTION: Draws a orange rectangle at (219, 75) with width 42 and height 36.
; PLAN: r0=219(x), r1=75(y), r2=42(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 75
LDI r2, 42
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
