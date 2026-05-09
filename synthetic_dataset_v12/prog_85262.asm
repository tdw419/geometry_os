; DESCRIPTION: Draws a red rectangle at (268, 14) with width 35 and height 86.
; PLAN: r0=268(x), r1=14(y), r2=35(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 14
LDI r2, 35
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
