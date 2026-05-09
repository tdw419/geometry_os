; DESCRIPTION: Draws a red rectangle at (28, 6) with width 46 and height 105.
; PLAN: r0=28(x), r1=6(y), r2=46(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 6
LDI r2, 46
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
