; DESCRIPTION: Draws a white rectangle at (77, 30) with width 50 and height 113.
; PLAN: r0=77(x), r1=30(y), r2=50(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 30
LDI r2, 50
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
