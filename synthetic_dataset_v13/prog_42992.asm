; DESCRIPTION: Draws a green rectangle at (457, 167) with width 50 and height 28.
; PLAN: r0=457(x), r1=167(y), r2=50(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 167
LDI r2, 50
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
