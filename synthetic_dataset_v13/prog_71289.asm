; DESCRIPTION: Draws a black rectangle at (370, 163) with width 53 and height 72.
; PLAN: r0=370(x), r1=163(y), r2=53(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 163
LDI r2, 53
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
