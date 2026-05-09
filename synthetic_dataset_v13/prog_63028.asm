; DESCRIPTION: Draws a green rectangle at (197, 151) with width 47 and height 38.
; PLAN: r0=197(x), r1=151(y), r2=47(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 151
LDI r2, 47
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
