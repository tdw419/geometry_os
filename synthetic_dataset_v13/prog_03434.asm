; DESCRIPTION: Draws a red rectangle at (230, 94) with width 91 and height 15.
; PLAN: r0=230(x), r1=94(y), r2=91(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 94
LDI r2, 91
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
