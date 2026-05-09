; DESCRIPTION: Draws a red rectangle at (109, 9) with width 62 and height 60.
; PLAN: r0=109(x), r1=9(y), r2=62(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 9
LDI r2, 62
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
