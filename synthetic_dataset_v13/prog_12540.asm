; DESCRIPTION: Draws a blue rectangle at (284, 115) with width 85 and height 86.
; PLAN: r0=284(x), r1=115(y), r2=85(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 115
LDI r2, 85
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
