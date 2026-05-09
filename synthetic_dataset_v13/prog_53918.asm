; DESCRIPTION: Draws a orange rectangle at (42, 53) with width 102 and height 16.
; PLAN: r0=42(x), r1=53(y), r2=102(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 53
LDI r2, 102
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
