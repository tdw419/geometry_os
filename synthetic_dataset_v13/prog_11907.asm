; DESCRIPTION: Draws a black rectangle at (391, 27) with width 101 and height 16.
; PLAN: r0=391(x), r1=27(y), r2=101(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 27
LDI r2, 101
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
