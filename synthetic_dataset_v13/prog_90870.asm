; DESCRIPTION: Draws a red rectangle at (371, 121) with width 49 and height 26.
; PLAN: r0=371(x), r1=121(y), r2=49(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 121
LDI r2, 49
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
