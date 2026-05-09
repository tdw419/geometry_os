; DESCRIPTION: Draws a purple rectangle at (61, 173) with width 35 and height 27.
; PLAN: r0=61(x), r1=173(y), r2=35(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 173
LDI r2, 35
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
