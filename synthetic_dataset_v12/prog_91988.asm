; DESCRIPTION: Draws a red rectangle at (318, 42) with width 30 and height 101.
; PLAN: r0=318(x), r1=42(y), r2=30(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 42
LDI r2, 30
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
