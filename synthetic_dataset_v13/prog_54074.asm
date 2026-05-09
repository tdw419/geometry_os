; DESCRIPTION: Draws a white rectangle at (313, 146) with width 14 and height 62.
; PLAN: r0=313(x), r1=146(y), r2=14(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 146
LDI r2, 14
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
