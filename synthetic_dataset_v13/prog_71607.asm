; DESCRIPTION: Draws a black rectangle at (278, 98) with width 67 and height 50.
; PLAN: r0=278(x), r1=98(y), r2=67(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 98
LDI r2, 67
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
