; DESCRIPTION: Draws a white rectangle at (330, 203) with width 113 and height 50.
; PLAN: r0=330(x), r1=203(y), r2=113(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 203
LDI r2, 113
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
