; DESCRIPTION: Draws a white rectangle at (53, 20) with width 99 and height 82.
; PLAN: r0=53(x), r1=20(y), r2=99(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 20
LDI r2, 99
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
