; DESCRIPTION: Draws a red rectangle at (22, 42) with width 58 and height 75.
; PLAN: r0=22(x), r1=42(y), r2=58(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 42
LDI r2, 58
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
