; DESCRIPTION: Draws a orange rectangle at (271, 42) with width 44 and height 85.
; PLAN: r0=271(x), r1=42(y), r2=44(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 42
LDI r2, 44
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
