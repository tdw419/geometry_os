; DESCRIPTION: Draws a black rectangle at (442, 13) with width 50 and height 64.
; PLAN: r0=442(x), r1=13(y), r2=50(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 13
LDI r2, 50
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
