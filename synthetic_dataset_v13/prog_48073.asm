; DESCRIPTION: Draws a red rectangle at (357, 96) with width 86 and height 13.
; PLAN: r0=357(x), r1=96(y), r2=86(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 96
LDI r2, 86
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
