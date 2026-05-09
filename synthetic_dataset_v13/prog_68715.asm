; DESCRIPTION: Draws a blue rectangle at (237, 195) with width 53 and height 26.
; PLAN: r0=237(x), r1=195(y), r2=53(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 195
LDI r2, 53
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
