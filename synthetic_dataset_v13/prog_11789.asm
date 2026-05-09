; DESCRIPTION: Draws a red rectangle at (333, 78) with width 46 and height 96.
; PLAN: r0=333(x), r1=78(y), r2=46(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 78
LDI r2, 46
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
