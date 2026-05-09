; DESCRIPTION: Draws a green rectangle at (61, 230) with width 93 and height 25.
; PLAN: r0=61(x), r1=230(y), r2=93(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 230
LDI r2, 93
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
