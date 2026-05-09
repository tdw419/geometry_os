; DESCRIPTION: Draws a black rectangle at (156, 167) with width 100 and height 58.
; PLAN: r0=156(x), r1=167(y), r2=100(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 167
LDI r2, 100
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
