; DESCRIPTION: Draws a black rectangle at (56, 74) with width 93 and height 14.
; PLAN: r0=56(x), r1=74(y), r2=93(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 74
LDI r2, 93
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
