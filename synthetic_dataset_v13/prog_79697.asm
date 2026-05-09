; DESCRIPTION: Draws a white rectangle at (306, 115) with width 61 and height 14.
; PLAN: r0=306(x), r1=115(y), r2=61(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 115
LDI r2, 61
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
