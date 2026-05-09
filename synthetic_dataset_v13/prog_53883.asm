; DESCRIPTION: Draws a white rectangle at (173, 69) with width 82 and height 89.
; PLAN: r0=173(x), r1=69(y), r2=82(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 69
LDI r2, 82
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
