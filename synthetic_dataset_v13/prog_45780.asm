; DESCRIPTION: Draws a green rectangle at (230, 206) with width 86 and height 19.
; PLAN: r0=230(x), r1=206(y), r2=86(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 206
LDI r2, 86
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
