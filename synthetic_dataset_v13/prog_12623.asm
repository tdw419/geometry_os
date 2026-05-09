; DESCRIPTION: Draws a red rectangle at (29, 76) with width 77 and height 86.
; PLAN: r0=29(x), r1=76(y), r2=77(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 76
LDI r2, 77
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
