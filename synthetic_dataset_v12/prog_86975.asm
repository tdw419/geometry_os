; DESCRIPTION: Draws a white rectangle at (197, 55) with width 20 and height 101.
; PLAN: r0=197(x), r1=55(y), r2=20(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 55
LDI r2, 20
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
