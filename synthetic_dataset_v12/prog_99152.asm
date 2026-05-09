; DESCRIPTION: Draws a white rectangle at (82, 158) with width 21 and height 40.
; PLAN: r0=82(x), r1=158(y), r2=21(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 158
LDI r2, 21
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
