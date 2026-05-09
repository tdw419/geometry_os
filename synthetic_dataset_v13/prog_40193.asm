; DESCRIPTION: Draws a white rectangle at (288, 5) with width 42 and height 114.
; PLAN: r0=288(x), r1=5(y), r2=42(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 5
LDI r2, 42
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
