; DESCRIPTION: Draws a orange rectangle at (268, 218) with width 85 and height 30.
; PLAN: r0=268(x), r1=218(y), r2=85(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 218
LDI r2, 85
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
