; DESCRIPTION: Draws a green rectangle at (238, 195) with width 83 and height 57.
; PLAN: r0=238(x), r1=195(y), r2=83(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 195
LDI r2, 83
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
