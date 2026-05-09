; DESCRIPTION: Draws a white rectangle at (291, 60) with width 120 and height 109.
; PLAN: r0=291(x), r1=60(y), r2=120(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 60
LDI r2, 120
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
