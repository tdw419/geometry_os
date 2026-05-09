; DESCRIPTION: Draws a blue rectangle at (126, 93) with width 109 and height 67.
; PLAN: r0=126(x), r1=93(y), r2=109(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 93
LDI r2, 109
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
