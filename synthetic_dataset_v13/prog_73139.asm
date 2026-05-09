; DESCRIPTION: Draws a red rectangle at (383, 102) with width 39 and height 104.
; PLAN: r0=383(x), r1=102(y), r2=39(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 102
LDI r2, 39
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
