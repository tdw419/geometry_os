; DESCRIPTION: Draws a blue rectangle at (213, 143) with width 76 and height 53.
; PLAN: r0=213(x), r1=143(y), r2=76(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 143
LDI r2, 76
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
