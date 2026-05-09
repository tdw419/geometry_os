; DESCRIPTION: Draws a black rectangle at (209, 12) with width 92 and height 28.
; PLAN: r0=209(x), r1=12(y), r2=92(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 12
LDI r2, 92
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
