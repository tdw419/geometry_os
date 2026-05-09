; DESCRIPTION: Draws a green rectangle at (167, 151) with width 98 and height 61.
; PLAN: r0=167(x), r1=151(y), r2=98(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 151
LDI r2, 98
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
