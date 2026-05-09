; DESCRIPTION: Draws a green rectangle at (355, 26) with width 60 and height 64.
; PLAN: r0=355(x), r1=26(y), r2=60(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 26
LDI r2, 60
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
