; DESCRIPTION: Draws a white rectangle at (355, 158) with width 86 and height 40.
; PLAN: r0=355(x), r1=158(y), r2=86(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 158
LDI r2, 86
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
