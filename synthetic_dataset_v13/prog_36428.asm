; DESCRIPTION: Draws a black rectangle at (130, 87) with width 84 and height 109.
; PLAN: r0=130(x), r1=87(y), r2=84(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 87
LDI r2, 84
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
