; DESCRIPTION: Draws a white rectangle at (157, 173) with width 21 and height 26.
; PLAN: r0=157(x), r1=173(y), r2=21(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 173
LDI r2, 21
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
