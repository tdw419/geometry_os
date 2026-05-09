; DESCRIPTION: Draws a green rectangle at (383, 45) with width 116 and height 38.
; PLAN: r0=383(x), r1=45(y), r2=116(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 45
LDI r2, 116
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
