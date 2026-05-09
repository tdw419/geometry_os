; DESCRIPTION: Draws a black rectangle at (418, 224) with width 24 and height 15.
; PLAN: r0=418(x), r1=224(y), r2=24(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 224
LDI r2, 24
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
