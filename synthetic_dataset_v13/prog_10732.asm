; DESCRIPTION: Draws a purple rectangle at (294, 86) with width 41 and height 22.
; PLAN: r0=294(x), r1=86(y), r2=41(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 86
LDI r2, 41
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
