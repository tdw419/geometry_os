; DESCRIPTION: Draws a green rectangle at (65, 59) with width 41 and height 59.
; PLAN: r0=65(x), r1=59(y), r2=41(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 59
LDI r2, 41
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
