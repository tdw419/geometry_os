; DESCRIPTION: Draws a red rectangle at (170, 60) with width 113 and height 101.
; PLAN: r0=170(x), r1=60(y), r2=113(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 60
LDI r2, 113
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
