; DESCRIPTION: Draws a black rectangle at (130, 21) with width 45 and height 22.
; PLAN: r0=130(x), r1=21(y), r2=45(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 21
LDI r2, 45
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
