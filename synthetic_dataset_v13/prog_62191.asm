; DESCRIPTION: Draws a red rectangle at (85, 164) with width 102 and height 58.
; PLAN: r0=85(x), r1=164(y), r2=102(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 164
LDI r2, 102
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
