; DESCRIPTION: Draws a red rectangle at (338, 155) with width 46 and height 59.
; PLAN: r0=338(x), r1=155(y), r2=46(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 155
LDI r2, 46
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
