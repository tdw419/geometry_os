; DESCRIPTION: Draws a red rectangle at (339, 114) with width 27 and height 32.
; PLAN: r0=339(x), r1=114(y), r2=27(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 114
LDI r2, 27
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
