; DESCRIPTION: Draws a white rectangle at (61, 15) with width 50 and height 47.
; PLAN: r0=61(x), r1=15(y), r2=50(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 15
LDI r2, 50
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
