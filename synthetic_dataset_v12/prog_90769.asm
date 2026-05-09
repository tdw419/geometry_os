; DESCRIPTION: Draws a blue rectangle at (284, 13) with width 41 and height 16.
; PLAN: r0=284(x), r1=13(y), r2=41(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 13
LDI r2, 41
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
