; DESCRIPTION: Draws a red rectangle at (59, 53) with width 44 and height 41.
; PLAN: r0=59(x), r1=53(y), r2=44(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 53
LDI r2, 44
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
