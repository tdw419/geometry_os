; DESCRIPTION: Draws a red rectangle at (23, 134) with width 62 and height 73.
; PLAN: r0=23(x), r1=134(y), r2=62(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 134
LDI r2, 62
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
