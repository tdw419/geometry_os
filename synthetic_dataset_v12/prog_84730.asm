; DESCRIPTION: Draws a green rectangle at (284, 116) with width 29 and height 101.
; PLAN: r0=284(x), r1=116(y), r2=29(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 116
LDI r2, 29
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
