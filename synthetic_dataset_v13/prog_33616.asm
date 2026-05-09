; DESCRIPTION: Draws a red rectangle at (184, 125) with width 116 and height 40.
; PLAN: r0=184(x), r1=125(y), r2=116(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 125
LDI r2, 116
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
