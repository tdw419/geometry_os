; DESCRIPTION: Draws a red rectangle at (265, 138) with width 12 and height 115.
; PLAN: r0=265(x), r1=138(y), r2=12(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 138
LDI r2, 12
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
