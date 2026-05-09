; DESCRIPTION: Draws a white rectangle at (164, 120) with width 88 and height 30.
; PLAN: r0=164(x), r1=120(y), r2=88(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 120
LDI r2, 88
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
