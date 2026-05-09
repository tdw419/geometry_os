; DESCRIPTION: Draws a white rectangle at (303, 96) with width 86 and height 101.
; PLAN: r0=303(x), r1=96(y), r2=86(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 96
LDI r2, 86
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
