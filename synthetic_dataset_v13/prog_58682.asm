; DESCRIPTION: Draws a green rectangle at (355, 62) with width 109 and height 60.
; PLAN: r0=355(x), r1=62(y), r2=109(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 62
LDI r2, 109
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
