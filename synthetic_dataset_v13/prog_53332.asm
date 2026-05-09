; DESCRIPTION: Draws a green rectangle at (380, 178) with width 22 and height 71.
; PLAN: r0=380(x), r1=178(y), r2=22(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 178
LDI r2, 22
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
