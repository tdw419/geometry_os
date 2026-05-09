; DESCRIPTION: Draws a purple rectangle at (294, 67) with width 40 and height 50.
; PLAN: r0=294(x), r1=67(y), r2=40(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 67
LDI r2, 40
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
