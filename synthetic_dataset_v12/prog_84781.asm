; DESCRIPTION: Draws a white rectangle at (167, 120) with width 30 and height 29.
; PLAN: r0=167(x), r1=120(y), r2=30(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 120
LDI r2, 30
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
