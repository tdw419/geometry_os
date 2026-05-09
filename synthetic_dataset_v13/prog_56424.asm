; DESCRIPTION: Draws a green rectangle at (251, 111) with width 28 and height 102.
; PLAN: r0=251(x), r1=111(y), r2=28(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 111
LDI r2, 28
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
