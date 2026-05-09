; DESCRIPTION: Draws a red rectangle at (178, 167) with width 116 and height 12.
; PLAN: r0=178(x), r1=167(y), r2=116(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 167
LDI r2, 116
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
