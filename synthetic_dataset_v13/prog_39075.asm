; DESCRIPTION: Draws a black rectangle at (130, 16) with width 30 and height 109.
; PLAN: r0=130(x), r1=16(y), r2=30(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 16
LDI r2, 30
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
