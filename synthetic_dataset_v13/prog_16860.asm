; DESCRIPTION: Draws a red rectangle at (56, 184) with width 40 and height 18.
; PLAN: r0=56(x), r1=184(y), r2=40(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 184
LDI r2, 40
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
