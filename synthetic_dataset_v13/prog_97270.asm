; DESCRIPTION: Draws a green rectangle at (211, 197) with width 74 and height 30.
; PLAN: r0=211(x), r1=197(y), r2=74(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 197
LDI r2, 74
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
