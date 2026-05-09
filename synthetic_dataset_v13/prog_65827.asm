; DESCRIPTION: Draws a red rectangle at (204, 13) with width 42 and height 101.
; PLAN: r0=204(x), r1=13(y), r2=42(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 13
LDI r2, 42
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
