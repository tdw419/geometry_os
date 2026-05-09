; DESCRIPTION: Draws a red rectangle at (6, 85) with width 58 and height 40.
; PLAN: r0=6(x), r1=85(y), r2=58(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 85
LDI r2, 58
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
