; DESCRIPTION: Draws a yellow rectangle at (223, 65) with width 41 and height 59.
; PLAN: r0=223(x), r1=65(y), r2=41(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 65
LDI r2, 41
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
