; DESCRIPTION: Draws a white rectangle at (303, 142) with width 78 and height 96.
; PLAN: r0=303(x), r1=142(y), r2=78(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 142
LDI r2, 78
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
