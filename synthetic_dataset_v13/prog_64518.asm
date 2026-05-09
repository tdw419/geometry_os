; DESCRIPTION: Draws a red rectangle at (81, 38) with width 39 and height 102.
; PLAN: r0=81(x), r1=38(y), r2=39(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 38
LDI r2, 39
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
