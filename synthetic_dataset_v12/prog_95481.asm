; DESCRIPTION: Draws a purple rectangle at (370, 45) with width 113 and height 40.
; PLAN: r0=370(x), r1=45(y), r2=113(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 45
LDI r2, 113
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
