; DESCRIPTION: Draws a red rectangle at (268, 21) with width 59 and height 101.
; PLAN: r0=268(x), r1=21(y), r2=59(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 21
LDI r2, 59
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
