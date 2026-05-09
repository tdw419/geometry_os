; DESCRIPTION: Draws a red rectangle at (28, 8) with width 40 and height 29.
; PLAN: r0=28(x), r1=8(y), r2=40(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 8
LDI r2, 40
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
