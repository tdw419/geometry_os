; DESCRIPTION: Draws a black rectangle at (96, 197) with width 93 and height 53.
; PLAN: r0=96(x), r1=197(y), r2=93(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 197
LDI r2, 93
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
