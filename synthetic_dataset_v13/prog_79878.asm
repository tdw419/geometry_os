; DESCRIPTION: Draws a black rectangle at (383, 246) with width 95 and height 10.
; PLAN: r0=383(x), r1=246(y), r2=95(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 246
LDI r2, 95
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
