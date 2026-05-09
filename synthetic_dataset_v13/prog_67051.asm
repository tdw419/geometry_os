; DESCRIPTION: Draws a blue rectangle at (130, 66) with width 32 and height 53.
; PLAN: r0=130(x), r1=66(y), r2=32(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 66
LDI r2, 32
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
