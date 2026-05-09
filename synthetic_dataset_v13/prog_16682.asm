; DESCRIPTION: Draws a purple rectangle at (64, 27) with width 41 and height 20.
; PLAN: r0=64(x), r1=27(y), r2=41(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 27
LDI r2, 41
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
