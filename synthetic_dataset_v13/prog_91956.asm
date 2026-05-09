; DESCRIPTION: Draws a white rectangle at (144, 50) with width 39 and height 78.
; PLAN: r0=144(x), r1=50(y), r2=39(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 50
LDI r2, 39
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
