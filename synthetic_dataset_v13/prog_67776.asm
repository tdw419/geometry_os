; DESCRIPTION: Draws a red rectangle at (37, 123) with width 86 and height 59.
; PLAN: r0=37(x), r1=123(y), r2=86(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 123
LDI r2, 86
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
