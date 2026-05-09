; DESCRIPTION: Draws a red rectangle at (158, 56) with width 42 and height 119.
; PLAN: r0=158(x), r1=56(y), r2=42(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 56
LDI r2, 42
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
