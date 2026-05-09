; DESCRIPTION: Draws a yellow rectangle at (130, 115) with width 64 and height 109.
; PLAN: r0=130(x), r1=115(y), r2=64(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 115
LDI r2, 64
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
