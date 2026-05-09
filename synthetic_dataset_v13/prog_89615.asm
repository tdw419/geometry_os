; DESCRIPTION: Draws a blue rectangle at (380, 197) with width 19 and height 57.
; PLAN: r0=380(x), r1=197(y), r2=19(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 197
LDI r2, 19
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
