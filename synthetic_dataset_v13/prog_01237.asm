; DESCRIPTION: Draws a orange rectangle at (394, 6) with width 35 and height 42.
; PLAN: r0=394(x), r1=6(y), r2=35(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 6
LDI r2, 35
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
